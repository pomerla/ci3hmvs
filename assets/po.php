<?php
            $url  = "http://".$_SERVER['HTTP_HOST']."/"; // домен сайта
            
            echo $url; // показать URL
            
            echo '<br />';
            
            echo implode('', array_slice(explode('/', $_SERVER['PHP_SELF']), 0, -1));
        ?>