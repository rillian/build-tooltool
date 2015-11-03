check: python-tests shell-tests validate

shell-tests:
	sh test.sh

python-tests: 
	clear
	python test_tooltool.py

python-test-%:
	clear
	python test_tooltool.py $*

validate: _relengapi
	source _relengapi/bin/activate && sh validate.sh

PACKAGES = relengapi pep8 pyflakes coverage mock nose
_relengapi:
	virtualenv _relengapi
	source _relengapi/bin/activate && pip install $(PACKAGES)

clean:
	-$(RM) -r _relengapi

.PHONY: check clean shell-tests python-tests python-tests-% validate
