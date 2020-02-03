package reprozip

import (
	"fmt"
	"strconv"
)

type AccessedFile struct {
	ID        string
	FilePath  string
	FileIndex int64
}

func GetAccessedFiles(executed []ExecutedFile, opened []OpenedFile) []AccessedFile {

	var accessed []AccessedFile

	WorkingDirFileIndex, _ = getFileIndex(executed[0].WorkingDir)

	for _, e := range executed {
		fileIndex, _ := getFileIndex(e.Name)
		path := trimWorkingDir(e.Name)
		f := AccessedFile{"e" + strconv.FormatInt(e.ID, 10), path, fileIndex}
		accessed = append(accessed, f)
	}

	for _, o := range opened {
		fileIndex, _ := getFileIndex(o.Name)
		path := trimWorkingDir(o.Name)
		f := AccessedFile{"o" + strconv.FormatInt(o.ID, 10), path, fileIndex}
		accessed = append(accessed, f)
	}

	return accessed
}

func (f AccessedFile) String() string {
	return fmt.Sprintf("rpz_accessed(%s, %s, %s).",
		f.ID, dq(f.FilePath), I(f.FileIndex))
}
