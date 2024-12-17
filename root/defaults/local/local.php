<?php
    if (!isset($config))
        $config = array();
   /*
    ***************************************************
    * Please read config_default.php for all possible
    * configuration items.
    * For changes in config_default.php see CHANGELOG.md
    * on the upstream project site.
    * https://github.com/mikespub-org/seblucas-cops/blob/main/config_default.php
    ***************************************************
    */
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

    /* Enable cache folder
     * especially useful for lower power hosts
     */
    $config['cops_thumbnail_handling'] = "";
    $config['cops_thumbnail_cache_directory'] = "/config/cache/";

    /*
     * Enable and configure Send To Kindle (or Email) feature.
     *
     * Don't forget to authorize the sender email you configured in your Kindle's  Approved Personal Document E-mail List.
     *
     * If you want to use a simple smtp server (provided by your ISP for example), you can configure it like that :
     * $config['cops_mail_configuration'] = array( "smtp.host"     => "smtp.free.fr",
     *                                           "smtp.username" => "",
     *                                           "smtp.password" => "",
     *                                           "smtp.secure"   => "",
     *                                           "address.from"  => "cops@slucas.fr"
     *                                           );
     *
     * For Gmail (ssl is mandatory) :
     * $config['cops_mail_configuration'] = array( "smtp.host"     => "smtp.gmail.com",
     *                                           "smtp.username" => "YOUR GMAIL ADRESS",
     *                                           "smtp.password" => "YOUR GMAIL PASSWORD",
     *                                           "smtp.secure"   => "ssl",
     *                                           "address.from"  => "cops@slucas.fr"
     *                                           );
     *
     * You'll also need to enable Allow Less Secure Apps in you Gmail account.
     */
    $config['cops_mail_configuration'] = array( "smtp.host"     => "",
                            "smtp.username" => "",
                            "smtp.password" => "",
                            "smtp.secure"   => "ssl",
                            "address.from"  => "cops@ebook.com"
    );

    /*
     * Use external 'kepubify' tool to convert .epub files to .kepub.epub format for Kobo
     * Example:
     * $config['cops_kepubify_path'] = '/usr/bin/kepubify';
     */
    //$config['cops_kepubify_path'] = '';
    $config['cops_kepubify_path'] = '/usr/bin/kepubify';

    /*
     * Set front controller to remove index.php/ from route URLs generated in COPS
     *
     * Note: this assumes your web server config will rewrite /... to /index.php/...
     * - Apache: .htaccess
     * - Nginx: nginx.conf
     * - PHP built-in: router.php
     * - ...
     *
     * @todo update nginx/site-confs/default.conf.sample to make use of front controller
     */
    $config['cops_front_controller'] = '';
    //$config['cops_front_controller'] = 'index.php';

