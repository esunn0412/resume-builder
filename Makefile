# ============================================================================
# Usage:
#   make watch                # live preview of resume.typ (the live resume)
#   make watch FILE=swe       # live preview of resume-swe.typ
#   make build                # export resume.pdf + resume-preview.png
#   make build FILE=ml        # export resume-ml.pdf + .png
#   make clean                # remove all generated PDFs/PNGs
#
# FILE accepts: resume (default), swe, ml — or the full "resume-xxx" name
# directly. Add a new variant just by adding a new resume-<name>.yaml/.typ
# pair; no new Makefile targets needed.
# ============================================================================

.PHONY: watch build clean

FILE ?= resume
BASE := $(if $(filter resume%,$(FILE)),$(FILE),resume-$(FILE))

watch:
	tinymist preview $(BASE).typ

# One-shot export: PDF + PNG preview together.
# --pages 1 keeps the PNG preview to a single page (a thumbnail for the
# README), even for multi-page variants like the full CV (resume.yaml).
build:
	typst compile $(BASE).typ $(BASE).pdf
	typst compile --ppi 200 --pages 1 $(BASE).typ $(BASE)-preview.png
	@echo "Exported $(BASE).pdf and $(BASE)-preview.png"

clean:
	rm -f resume.pdf resume-preview.png \
	      resume-swe.pdf resume-swe-preview.png \
	      resume-ml.pdf resume-ml-preview.png
