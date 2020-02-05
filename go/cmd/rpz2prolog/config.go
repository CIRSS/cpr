package main

import (
	"io/ioutil"

	"gopkg.in/yaml.v2"
)

type Config struct {
	Dirs struct {
		Os       []string
		Software []string
		Input    []string
		Output   []string
	}
}

func ParseConfig(data []byte) Config {
	var c Config
	err := yaml.Unmarshal([]byte(data), &c)
	if err != nil {
		panic(err)
	}
	return c
}

func LoadConfig(filename string) Config {
	data, err := ioutil.ReadFile(filename)
	if err != nil {
		panic(err)
	}
	config := ParseConfig(data)
	return config
}
