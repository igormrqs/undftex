% ----------------------------------------------------
% Projeto: UnDF-TeX
% Arquivo: undftex.cls
%
% Copyright (c) 2026
% Universidade do Distrito Federal (UnDF)
%
% Este arquivo faz parte do projeto UnDF-TeX.
%
% Licenciado sob a LaTeX Project Public License (LPPL),
% versão 1.3c ou posterior.
%
% Implementação técnica baseada nas normas:
% ABNT NBR 14724:2024
% ABNT NBR 10520:2023
% ABNT NBR 6028:2021
% ABNT NBR 6027:2012
% ABNT NBR 6023:2025
%
% Este projeto não reproduz o texto integral
% das normas da ABNT.
% ----------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{undftex}[2026/01/01 UnDF-TeX class]

\newif\ifundfartigo
\DeclareOption{perfil=monografia}{\undfartigofalse}
\DeclareOption{perfil=artigo}{\undfartigotrue}
\DeclareOption*{\ClassError{undftex}{Opcao desconhecida: \CurrentOption}{Use perfil=monografia ou perfil=artigo.}}
\ExecuteOptions{perfil=monografia}
\ProcessOptions\relax
\LoadClass[12pt,a4paper,oneside]{report}

\makeatletter
\def\input@path{{src/core/}{src/identity/}{src/abnt/}{src/biblatex/}}
\makeatother

% ----------------------------------------------------
% Verificação do compilador
% ----------------------------------------------------
\RequirePackage{ifluatex}

\ifluatex
\else
  \ClassError{undftex}
    {Esta classe exige LuaLaTeX}
    {Compile o documento utilizando LuaLaTeX.}
\fi

% ----------------------------------------------------
% Núcleo técnico
% ----------------------------------------------------
\ifundfartigo
  \PassOptionsToPackage{english}{babel}
\fi
\RequirePackage{undf-engine}
\RequirePackage{undf-metadata}
\RequirePackage{undf-identity}
\RequirePackage{undf-crossrefs}
\RequirePackage{undf-files}
\RequirePackage{undf-layout}
\RequirePackage{undf-titles}
\RequirePackage{undf-headings}
\RequirePackage{undf-structure}
\RequirePackage{undf-toccore}
\RequirePackage{undf-titlepages}
\RequirePackage{undf-hyperref}

% ----------------------------------------------------
% Camada normativa ABNT
% ----------------------------------------------------
\RequirePackage{abnt-nbr14724-2024}
\RequirePackage{abnt-nbr6028-2021}
\RequirePackage{abnt-nbr6027-2012}
\RequirePackage{abnt-nbr6023-2025}

% ----------------------------------------------------
% Camada bibliográfica institucional
% ----------------------------------------------------
\RequirePackage{undf-biblatex}

% ----------------------------------------------------
% Identidade institucional
% ----------------------------------------------------
\RequirePackage{undf-cover}

% O perfil altera somente o miolo; a estrutura institucional é compartilhada.
\ifundfartigo
  \RequirePackage{src/profiles/undf-artigo}
\fi
