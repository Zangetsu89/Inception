<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * Localized language
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** Database username */
define( 'DB_USER', 'testmysqlpass5' );

/** Database password */
define( 'DB_PASSWORD', 'edawood' );

/** Database hostname */
define( 'DB_HOST', 'mariadb' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',          'a:drdaSd`ggY3+3vi=hzW:e]=YaxX@UQ6VZ7h`Z:G7$QkjQc}*utNV :$ZtspNdc' );
define( 'SECURE_AUTH_KEY',   'z7sVCo:OxMl.yHpy2Uk6m2B(^&5qx$5*_Ucfq<r<2I51Vw?^Q63gkjOri,ih1mgy' );
define( 'LOGGED_IN_KEY',     'Q#GEV_t cnjx`h5+[6vrx:<!QL4mg]//i>?ni!)by_mB>/r|zL;8BY^z-HJPlqiv' );
define( 'NONCE_KEY',         '?|KISl8D_uY+V!~k;;bd[>*vf6%iQt1vJ=~MO^Qp(4[ef@FBGCz!HwOQeYFO$}pC' );
define( 'AUTH_SALT',         'nvltxRoy9r%rT?~13N[a3>((x,=.?XllQF~Me5+^-7G|^-(Zvy)Z3mta?|e;+!x-' );
define( 'SECURE_AUTH_SALT',  't0(dS?ET =.UU;GlConQ[0D!h~h&t-$w0Zmvl;vjH&Gy!9VR?Wp<%41]9 y~hA7g' );
define( 'LOGGED_IN_SALT',    '6eH@xotG[wk089;+p g@N@E?3w>HF_(N[K{*/+aeE4B[?3,G%%;4}2ir<k*rVU/y' );
define( 'NONCE_SALT',        'iQ591)p[.:e-e5P AE40ZUjs@GF,o&=LwDN!f!j!X,TEme< Z`N u,5hzfV3z,>0' );
define( 'WP_CACHE_KEY_SALT', '{lR^; 73G7f!Nttemjos+S%egEDi70pb7oa9R(48>iz^aucf*A02WSYp}P|88qUG' );


/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';


/* Add any custom values between this line and the "stop editing" line. */



/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
if ( ! defined( 'WP_DEBUG' ) ) {
	define( 'WP_DEBUG', false );
}

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
