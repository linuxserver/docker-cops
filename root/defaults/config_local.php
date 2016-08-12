<?php
    if (!isset($config))
        $config = array();

    /*
     * The directory containing calibre's metadata.db file, with sub-directories
     * containing all the formats.
     * BEWARE : it has to end with a /
     */
    $config['calibre_directory'] = '/books/';

    $config['calibre_internal_directory'] = '/books/';

    /*
     * Catalog's title
     */
    $config['cops_title_default'] = "COPS";

    /*
     * use URL rewriting for downloading of ebook in HTML catalog
     * See README for more information
     *  1 : enable
     *  0 : disable
     */
    $config['cops_use_url_rewriting'] = "0";

	/*
     * Which header to use when downloading books outside the web directory
     * Possible values are :
     *   X-Accel-Redirect   : For Nginx
     *   X-Sendfile         : For Lightttpd or Apache (with mod_xsendfile)
     *   No value (default) : Let PHP handle the download
     */

	 $config['cops_x_accel_redirect'] = "X-Accel-Redirect";

    /*
     * use URL rewriting for downloading of ebook in HTML catalog
     * See README for more information
     *  1 : enable
     *  0 : disable
     */

	$config['cops_mail_configuration'] = array( "smtp.host"     => "",
						    "smtp.username" => "",
						    "smtp.password" => "",
						    "smtp.secure"   => "ssl",
						    "address.from"  => "COPS"
);
