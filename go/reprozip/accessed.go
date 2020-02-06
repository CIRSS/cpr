package reprozip

import (
	"fmt"
)

type AccessedFile struct {
	ID        string
	FilePath  string
	FileIndex int64
}

func GetAccessedFiles(executed []ExecutedFile, opened []OpenedFile) []AccessedFile {

	var accessed []AccessedFile

	WorkingDirFileIndex, _ = Index(executed[0].WorkingDir)

	for _, e := range executed {
		fileIndex, _ := Index(e.Name)
		path := TrimWorkingDirPrefix(e.Name)
		f := AccessedFile{E(e.ID), path, fileIndex}
		accessed = append(accessed, f)
	}

	for _, o := range opened {
		fileIndex, _ := Index(o.Name)
		path := TrimWorkingDirPrefix(o.Name)
		f := AccessedFile{O(o.ID), path, fileIndex}
		accessed = append(accessed, f)
	}

	return accessed
}

func (f AccessedFile) String() string {
	return fmt.Sprintf("wt_accessed(%s, %s, %s).",
		f.ID, Q(f.FilePath), I(f.FileIndex))
}
