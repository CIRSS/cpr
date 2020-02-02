package reprozip

import (
	"fmt"
	"strconv"
)

type AccessedFile struct {
	ID string
	FilePath string
	FileIndex int
}

func GetAccessedFiles(executed []ExecutedFile, opened []OpenedFile) []AccessedFile {

	var efs []AccessedFile

	for _, e := range(executed) {
		fileIndex := getFileIndex(e.Name)
		f := AccessedFile{ "e" + strconv.Itoa(e.ID), e.Name, fileIndex }
		efs = append(efs, f)
	}

	for _, o := range(opened) {
		fileIndex := getFileIndex(o.Name)
		f := AccessedFile{ "o" + strconv.Itoa(o.ID), o.Name, fileIndex }
		efs = append(efs, f)
	}

	return efs
}


func (f *AccessedFile) String() string {
	return fmt.Sprintf("rpz_accessed_file(%s, %s, i%d).",
		f.ID, dq(f.FilePath), f.FileIndex)
}
