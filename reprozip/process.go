package reprozip

import (
	"fmt"
)

type Process struct {
 	ID int
	RunID int
	Parent int
	Timestamp int
	IsThread bool
	ExitCode int
}

func (p *Process) String() string {
	return fmt.Sprintf("rz_process(%d, %d, %d, %d, %t, %d).", 
		p.ID, p.RunID, p.Parent, p.Timestamp, p.IsThread, p.ExitCode)
}