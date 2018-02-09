TOOLS = sambamba_0.6.6 \
		sambamba_0.6.8-pre1 \
		samtools_1.3 \
		samtools_1.7

BASE_URL = https://github.com
DOCKER_REPO = grape

.PHONY: clean docker $(TOOLS)

docker: $(TOOLS)

$(TOOLS): % :
	$(eval NAME = $(word 1,$(subst _, ,$@)))
	$(eval VER = $(word 2,$(subst _, ,$@)))
	@ echo "Building docker image for $(NAME) v$(VER)"
	@- docker build -t $(DOCKER_REPO)/$(NAME):$(VER) --build-arg baseUrl=$(BASE_URL) --build-arg ver=$(VER) docker/$(NAME) > docker/$(NAME)/build-$(VER).log

clean:
	@rm -rf work .nextflow* *.[0-9]+ trace.txt* report.html*