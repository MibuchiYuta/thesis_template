#!/usr/bin/env perl

# LaTeXの設定
$latex = 'uplatex -synctex=1 -halt-on-error -file-line-error %O %S';
$pdflatex = 'uplatex -synctex=1 -halt-on-error -file-line-error %O %S';  # 追加
$max_repeat = 5;

# BibTeXの設定
$bibtex = 'pbibtex %O %S';
$biber = 'biber --bblencoding=utf8 -u -U --output_safechars %O %S';

# インデックス作成の設定
$makeindex = 'mendex %O -o %D %S';

# DVIからPDFへの変換設定
$dvipdf = 'dvipdfmx %O -o %D %S';
$pdf_mode = 3;

# プレビュー設定
$pvc_view_file_via_temporary = 0;
if ($^O eq 'linux') {
    # Linuxの場合のプレビュー設定
    $dvi_previewer = "xdg-open %S";
    $pdf_previewer = "xdg-open %S";
} elsif ($^O eq 'darwin') {
    # macOSの場合のプレビュー設定
    $dvi_previewer = "open %S";
    $pdf_previewer = "open %S";
} else {
    # その他のOSの場合のプレビュー設定
    $dvi_previewer = "start %S";
    $pdf_previewer = "start %S";
}

# clean up
$clean_full_ext = "%R.synctex.gz"
