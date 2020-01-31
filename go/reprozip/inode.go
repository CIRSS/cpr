package reprozip

import (
    "fmt"
    "os"
    "syscall"
)

var (
	nextFileIndex = 1
	FileIndex map[uint64]int
)

func init() {
	FileIndex = make(map[uint64]int)
}

func getFileIndex(filename string) int {
	inode := getInode(filename)
	index, ok := FileIndex[inode]
	if !ok {
		index = nextFileIndex
		FileIndex[inode] = index
		nextFileIndex++
	}
	return index
}

func getInode(filename string) uint64 {

	fileinfo, err := os.Stat(filename)
	if err != nil {
		fmt.Println(err)
		return 0
	}

    stat, conversionOk := fileinfo.Sys().(*syscall.Stat_t)
    if !conversionOk {
        fmt.Printf("Err or casting to Stat_t")
        return 0
    }

	return stat.Ino
}
