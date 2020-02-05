package reprozip

import (
	"testing"
)

func assertLength(t *testing.T, slice []string, length int) {
	if len(slice) != length {
		t.Fail()
	}
}

func assertEquals(t *testing.T, expected string, actual string) {
	if expected != actual {
		t.Fail()
	}
}

func parseConfigString(s string) Config {
	return ParseConfig([]byte(s))
}

func TestConfig_empty_config(t *testing.T) {
	config := parseConfigString("")
	assertLength(t, config.Dirs.Os, 0)
}

func TestConfig_two_os_dirs(t *testing.T) {
	config := parseConfigString(`---
dirs:
  os:
  - /etc
  - /bin
`)
	assertLength(t, config.Dirs.Software, 0)
	assertLength(t, config.Dirs.Input, 0)
	assertLength(t, config.Dirs.Output, 0)

	assertLength(t, config.Dirs.Os, 2)
	assertEquals(t, "/etc", config.Dirs.Os[0])
	assertEquals(t, "/bin", config.Dirs.Os[1])
}

func TestConfig_one_software_dir(t *testing.T) {
	config := parseConfigString(`---
dirs:
  software:
  - /opt
`)
	assertLength(t, config.Dirs.Os, 0)
	assertLength(t, config.Dirs.Input, 0)
	assertLength(t, config.Dirs.Output, 0)

	assertLength(t, config.Dirs.Software, 1)
	assertEquals(t, "/opt", config.Dirs.Software[0])
}

func TestConfig_two_input_one_output_dirs(t *testing.T) {
	config := parseConfigString(`---
dirs:
  input:
  - /data
  - ./input
  output:
  - output
`)
	assertLength(t, config.Dirs.Os, 0)
	assertLength(t, config.Dirs.Software, 0)

	assertLength(t, config.Dirs.Input, 2)
	assertEquals(t, "/data", config.Dirs.Input[0])

	assertLength(t, config.Dirs.Output, 1)
	assertEquals(t, "./input", config.Dirs.Input[1])
	assertEquals(t, "output", config.Dirs.Output[0])
}
