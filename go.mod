module github.com/cirss/cpr

go 1.16

replace github.com/cirss/go-cli => ../go-cli

replace github.com/cirss/blaze => ../blaze

replace github.com/cirss/geist => ../geist

require (
	github.com/cirss/blaze v0.2.4
	github.com/cirss/geist v0.2.4
	github.com/cirss/go-cli v0.1.4
	github.com/mattn/go-sqlite3 v2.0.2+incompatible
	gopkg.in/yaml.v2 v2.2.8
)
