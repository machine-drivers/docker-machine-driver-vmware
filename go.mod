module github.com/machine-drivers/docker-machine-driver-vmware

go 1.15

require (
	github.com/Azure/go-ansiterm v0.0.0-20170929234023-d6e3b3328b78 // indirect
	github.com/docker/docker v17.12.0-ce-rc1.0.20190115220918-5ec31380a5d3+incompatible // indirect
	github.com/docker/machine v0.16.2
	github.com/google/go-cmp v0.5.4 // indirect
	github.com/hectane/go-acl v0.0.0-20190604041725-da78bae5fc95 // indirect
	github.com/pkg/errors v0.9.1 // indirect
	github.com/sirupsen/logrus v1.3.0 // indirect
	golang.org/x/crypto v0.0.0-20190103213133-ff983b9c42bc
	golang.org/x/sys v0.0.0-20190529164535-6a60838ec259
	gotest.tools v2.2.0+incompatible // indirect
)

replace github.com/docker/machine => github.com/machine-drivers/machine v0.7.1-0.20210719174735-6eca26732baa
