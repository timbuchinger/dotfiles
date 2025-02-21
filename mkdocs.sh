sudo apt install mkdocs
pip install mkdocs-material
mkdir mysite
cd mysite
mkdocs new .

edit mkdocs.yml and add
nav:
  - 'index.md'
theme:
  name: material
  palette:
    scheme: slate



mkdocs serve
Go to http://localhost:8000

mkdocs build
