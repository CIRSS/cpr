package reprozip

import (
	"os"
	"syscall"
)

var (
	nextFileIndex = 1
	fileIndex     map[uint64]int
)

func init() {
	fileIndex = make(map[uint64]int)
}

func getFileIndex(filename string) (index int, ok bool) {

	inodeNum, ok := inode(filename)
	if !ok {
		return 0, false
	}

	index, ok = fileIndex[inodeNum]
	if !ok {
		index = nextFileIndex
		fileIndex[inodeNum] = index
		nextFileIndex++
	}

	return index, true
}

// inode returns the inode number for the file at the
// given path
func inode(filepath string) (uint64, bool) {

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

func trimWorkingDir(path string) string {
	return path
}
