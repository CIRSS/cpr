package prov

import (
	"os"
	"strings"
	"syscall"
)

var (
	nextFileIndex = int64(1)
	index         map[uint64]int64
	directoryRole map[int64]string
)

func init() {
	index = make(map[uint64]int64)
	directoryRole = make(map[int64]string)
}

func RegisterDirectory(path string, dirType string) (fileIndex int64, ok bool) {
	fileIndex, ok = FileIndex(path)
	if ok {
		directoryRole[fileIndex] = dirType
	}
	return fileIndex, ok
}

func FileIndex(filename string) (fileIndex int64, ok bool) {

	inodeNum, ok := Inode(filename)
	if !ok {
		return 0, false
	}

	fileIndex, ok = index[inodeNum]
	if !ok {
		fileIndex = nextFileIndex
		index[inodeNum] = fileIndex
		nextFileIndex++
	}

	return fileIndex, true
}

// Inode returns the inode number for the file at the
// given absolutePath
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

func FileRole(path string) string {

	prefix := path
	prefixLength := len(path)

	for {
		prefixFileIndex, ok := FileIndex(prefix)
		t, ok := directoryRole[prefixFileIndex]
		if ok {
			return t
		}

		prefixLength = strings.LastIndex(prefix, "/")
		if prefixLength == -1 {
			break
		}

		prefix = prefix[:prefixLength]
	}

	return "nil"
}

func TrimWorkingDirPrefix(absolutePath string) string {

	prefix := absolutePath
	prefixLength := len(absolutePath)

	for {
		prefixFileIndex, ok := FileIndex(prefix)
		if !ok {
			return absolutePath
		}

		if prefixFileIndex == WorkingDirFileIndex {
			return "." + absolutePath[prefixLength:]
		}

		prefixLength = strings.LastIndex(prefix, "/")
		if prefixLength == -1 {
			break
		}

		prefix = prefix[:prefixLength]
	}

	return absolutePath
}
