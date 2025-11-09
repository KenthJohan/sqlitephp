<?php

include_once '../../misc/fs.php';

header('Content-Type: text/plain');
var_dump(fs_find_files_with_ext("../../../svd", "svd"));