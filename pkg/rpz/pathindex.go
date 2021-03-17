package rpz

import (
	"os"
	"strings"
	"syscall"
)

var (
	nextPathIndex     = int64(1)
	indexForPathInode map[uint64]int64
)

func init() {
	indexForPathInode = make(map[uint64]int64)
}

func PathIndex(path string) (pathIndex int64, ok bool) {
	inodeNum, ok := inode(path)
	if !ok {
		return 0, false
	}
	pathIndex, ok = indexForPathInode[inodeNum]
	if !ok {
		pathIndex = nextPathIndex
		indexForPathInode[inodeNum] = pathIndex
		nextPathIndex++
	}
	return pathIndex, true
}

func TrimWorkingDirPrefix(absolutePath string) string {
	prefix := absolutePath
	prefixLength := len(absolutePath)
	for {
		prefixPathIndex, ok := PathIndex(prefix)
		if !ok {
			return absolutePath
		}
		if prefixPathIndex == WorkingDirPathIndex {
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

// Inode returns the inode number for the given absolute path
func inode(path string) (uint64, bool) {
	fileinfo, err := os.Stat(path)
	if err != nil {
		return 0, false
	}
	stat, ok := fileinfo.Sys().(*syscall.Stat_t)
	if !ok {
		panic("Error casting file information to Stat_t")
	}
	return stat.Ino, true
}
