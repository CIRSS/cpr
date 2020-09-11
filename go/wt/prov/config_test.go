package prov

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
	assertLength(t, config.Roles.Os, 0)
}

func TestConfig_two_os_dirs(t *testing.T) {
	config := parseConfigString(`---
roles:
  os:
  - /etc
  - /bin
`)
	assertLength(t, config.Roles.Sw, 0)
	assertLength(t, config.Roles.In, 0)
	assertLength(t, config.Roles.Out, 0)

	assertLength(t, config.Roles.Os, 2)
	assertEquals(t, "/etc", config.Roles.Os[0])
	assertEquals(t, "/bin", config.Roles.Os[1])
}

func TestConfig_one_software_dir(t *testing.T) {
	config := parseConfigString(`---
roles:
  sw:
  - /opt
`)
	assertLength(t, config.Roles.Os, 0)
	assertLength(t, config.Roles.In, 0)
	assertLength(t, config.Roles.Out, 0)

	assertLength(t, config.Roles.Sw, 1)
	assertEquals(t, "/opt", config.Roles.Sw[0])
}

func TestConfig_two_input_one_output_dirs(t *testing.T) {
	config := parseConfigString(`---
roles:
  in:
  - /data
  - ./input
  out:
  - output
`)
	assertLength(t, config.Roles.Os, 0)
	assertLength(t, config.Roles.Sw, 0)

	assertLength(t, config.Roles.In, 2)
	assertEquals(t, "/data", config.Roles.In[0])

	assertLength(t, config.Roles.Out, 1)
	assertEquals(t, "./input", config.Roles.In[1])
	assertEquals(t, "output", config.Roles.Out[0])
}
