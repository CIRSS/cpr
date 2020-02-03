package reprozip

import (
	"os"
	"strings"
	"syscall"
)

var (
	NextFileIndex = int64(1)
	FileIndex     map[uint64]int64
)

func init() {
	FileIndex = make(map[uint64]int64)
}

func Index(filename string) (index int64, ok bool) {

	inodeNum, ok := Inode(filename)
	if !ok {
		return 0, false
	}

	index, ok = FileIndex[inodeNum]
	if !ok {
		index = NextFileIndex
		FileIndex[inodeNum] = index
		NextFileIndex++
	}

	return index, true
}

// Inode returns the inode number for the file at the
// given path
func Inode(filepath string) (uint64, bool) {

	fileinfo, err := os.Stat(filepath)
	if err != nil {
		return 0, false
	}

	stat, ok := fileinfo.Sys().(*syscall.Stat_t)
	if !ok {
		panic("Error casting file information to Stat_t")
	}

	return stat.Ino, true
}

func TrimWorkingDir(path string) string {

	current := path
	currentLength := len(path)
	for {
		indexOfCurrent, _ := Index(current)
		if indexOfCurrent == WorkingDirFileIndex {
			return "." + path[currentLength:]
		}
		currentLength = strings.LastIndex(current, "/")
		if currentLength == -1 {
			break
		}
		current = current[:currentLength]
	}

	return path
}
