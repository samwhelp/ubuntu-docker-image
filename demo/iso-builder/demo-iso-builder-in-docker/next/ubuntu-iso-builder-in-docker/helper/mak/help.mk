

help:
	@echo 'Usage:'
	@echo '	$$ make [action]'
	@echo
	@echo 'Example:'
	@echo '	$$ make'
	@echo '	$$ make help'
	@echo
	@echo '	$$ make box-build'
	@echo '	$$ make box-run'
	@echo
	@echo '	$$ make master-build'
	@echo
	@echo '	$$ make ubuntu-iso-builder-next-template'
	@echo '	$$ make ubuntu-iso-builder-next-respin-xfce'
	@echo '	$$ make ubuntu-iso-builder-next-include-pacstall-xfce-attach-themes'
	@echo
.PHONY: help
