<?php

function fs_find_files_with_ext($path, $ext)
{
    $rii = new RecursiveIteratorIterator(new RecursiveDirectoryIterator($path));

    $files = array();
    foreach ($rii as $file) {
        if ($file->isDir()) {
            continue;
        }
        $pathname = $file->getPathname();
        $name = pathinfo($pathname);
        if ($name['extension'] === $ext) {
            $files[] = $name;
        }
    }
    return $files;
}
