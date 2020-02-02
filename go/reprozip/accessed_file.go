package reprozip

import (
	"fmt"
	"strconv"
)

type AccessedFile struct {
	ID        string
	FilePath  string
	FileIndex int
}

func GetAccessedFiles(executed []ExecutedFile, opened []OpenedFile) []AccessedFile {

	var efs []AccessedFile

	WorkingDirFileIndex, _ = getFileIndex(executed[0].WorkingDir)

	for _, e := range executed {
		fileIndex, _ := getFileIndex(e.Name)
		path := trimWorkingDir(e.Name)
		f := AccessedFile{"e" + strconv.Itoa(e.ID), path, fileIndex}
		efs = append(efs, f)
	}

	for _, o := range opened {
		fileIndex, _ := getFileIndex(o.Name)
		path := trimWorkingDir(o.Name)
		f := AccessedFile{"o" + strconv.Itoa(o.ID), path, fileIndex}
		efs = append(efs, f)
	}

	return efs
}

func (f *AccessedFile) String() string {
	return fmt.Sprintf("rpz_accessed_file(%s, %s, i%d).",
		f.ID, dq(f.FilePath), f.FileIndex)
}
