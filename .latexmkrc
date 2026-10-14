# ----------------------------------------------------
# Projeto: UnDF-TeX
# Arquivo: .latexmkrc
#
# Configuração do latexmk para compilação reprodutível
# com LuaLaTeX + Biber, em uma única chamada:
#
#   latexmk                       (compila tcc.tex)
#   latexmk tcc-exemplo-undf.tex  (compila o exemplo completo)
#   latexmk -C                    (remove artefatos de compilação)
#
# O Overleaf também lê este arquivo automaticamente.
# ----------------------------------------------------

# Motor oficial do projeto: LuaLaTeX (a classe undftex exige LuaLaTeX)
$pdf_mode = 4;
$postscript_mode = 0;
$dvi_mode = 0;

$lualatex = 'lualatex -interaction=nonstopmode -file-line-error -halt-on-error %O %S';

# Bibliografia com Biber (detectado pelo .bcf gerado pelo biblatex)
$bibtex_use = 2;

# Documento padrão quando latexmk é chamado sem argumentos
@default_files = ('tcc.tex');

# Extensão extra gerada pelo template (lista de fluxogramas)
push @generated_exts, 'lofl';

# Arquivos adicionais removidos por latexmk -c / -C
$clean_ext .= ' synctex.gz run.xml';
