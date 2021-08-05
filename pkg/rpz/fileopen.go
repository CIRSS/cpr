package rpz

import (
	"database/sql"
	"fmt"
	"io"

	"github.com/cirss/cpr/pkg/cpr"
	"github.com/cirss/geist/pkg/rdf"
)

// FileOpen represents a row in the opened_files table of trace.sqlite3
type FileOpen struct {
	OpenID      int64
	RunID       int64
	Name        string
	Timestamp   uint64
	Mode        int64
	IsDirectory bool
	Process     int64
}

// GetFileOpens returns all rows in the opened_files table of trace.sqlite3
func GetFileOpens(trace Trace, db *sql.DB) []FileOpen {
	var opened []FileOpen
	rows, err := db.Query("SELECT id, run_id, name, timestamp, mode, is_directory, process FROM opened_files")
	if err != nil {
		panic(err)
	}
	for rows.Next() {
		var f FileOpen
		err := rows.Scan(&f.OpenID, &f.RunID, &f.Name, &f.Timestamp, &f.Mode, &f.IsDirectory, &f.Process)
		if err != nil {
			fmt.Println(err)
			return opened
		}
		if IgnoreFirstProcessFiles && f.Process == trace.FirstProcess {
			continue
		}

		path := TrimWorkingDirPrefix(f.Name)
		role := cpr.Role(path)
		if role != "nul" {
			opened = append(opened, f)
		}
	}
	return opened
}

func WriteFileOpenFacts(w io.Writer, opens []FileOpen) {
	cpr.PrintRowHeader(w, "cpr_file_open(OpenID, RunID, ProcessID, FilePath, Mode, IsDirectory, Timestamp).")
	for _, fo := range opens {
		fmt.Fprintln(w, fo)
	}
}

// String prints one row of the opened_files table of trace.sqlite3 as a Prolog fact
func (fo FileOpen) String() string {
	return fmt.Sprintf("cpr_file_open(%s, %s, %s, %s, %#v, %t, %s).",
		O(fo.OpenID), cpr.R(fo.RunID), P(fo.Process), cpr.Q(fo.Name), fo.Mode, fo.IsDirectory, cpr.TimestampUint64(fo.Timestamp))
}

func AddFileOpenTriples(g *rdf.Graph, fileOpens []FileOpen) {
	for _, fo := range fileOpens {
		accessURI := FileAccessUri(g, fo.Process, fo.OpenID)
		processURI := ProcessUri(g, fo.Process)
		g.AddNewTriple(processURI, "os:performedAccess", accessURI)
		if fo.IsDirectory {
			g.AddNewTriple(accessURI, "rdf:type", g.NewUri("os:DirectoryAccess"))
		} else {
			g.AddNewTriple(accessURI, "rdf:type", g.NewUri("os:FileAccess"))
			pathIndex, _ := cpr.PathIndex(fo.Name)
			g.AddNewTriple(accessURI, "os:resourcePath", AccessedPathUri(g, pathIndex))
		}
		g.AddNewTriple(accessURI, "os:accessPath", fo.Name)
		switch fo.Mode {
		case 1:
			g.AddNewTriple(accessURI, "os:accessMode", g.NewUri("cpr:Read"))
		case 2:
			g.AddNewTriple(accessURI, "os:accessMode", g.NewUri("cpr:Write"))
		case 4:
			g.AddNewTriple(accessURI, "os:accessMode", g.NewUri("cpr:Search"))
		}
		g.AddNewTriple(accessURI, "os:accessStartTime", cpr.TimestampUint64(fo.Timestamp))
		g.AddNewTriple(accessURI, "os:resourceRole", cpr.Role(fo.Name))
	}
}

func FileAccessUri(g *rdf.Graph, processID int64, openID int64) rdf.Uri {
	processURI := ProcessUri(g, processID)
	return g.NewExtendedUri(processURI, fmt.Sprintf("access/%d", openID))
}
