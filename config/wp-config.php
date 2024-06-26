<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the website, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/documentation/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', getenv('WORDPRESS_DB_NAME') );

/** Database username */
define( 'DB_USER', getenv('WORDPRESS_DB_USER') );

/** Database password */
define( 'DB_PASSWORD', getenv('WORDPRESS_DB_PASSWORD') );

/** Database hostname */
define( 'DB_HOST', getenv('WORDPRESS_DB_HOST') );

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
// define( 'AUTH_KEY',         'put your unique phrase here' );
// define( 'SECURE_AUTH_KEY',  'put your unique phrase here' );
// define( 'LOGGED_IN_KEY',    'put your unique phrase here' );
// define( 'NONCE_KEY',        'put your unique phrase here' );
// define( 'AUTH_SALT',        'put your unique phrase here' );
// define( 'SECURE_AUTH_SALT', 'put your unique phrase here' );
// define( 'LOGGED_IN_SALT',   'put your unique phrase here' );
// define( 'NONCE_SALT',       'put your unique phrase here' );

	define('AUTH_KEY',         'IH,f-|8^<;8yq9/z3-ijdwLW*)n[M9{i#kT$HqO:(QspLzbIM;3iaNFSwD`<l6[I');
	define('SECURE_AUTH_KEY',  '0x3ON,v`Xjk}q VN9xVBa@RS.5T!5@@q_H/8&j82Mq3DLq:G^tj/OK<ct+!+aBcS');
	define('LOGGED_IN_KEY',    'mxOd:lM@Dw%aW%sWq|w)gy7 W/}OHnTt{;xJ;&Co6qp[||kMtk+R?[E~|~J1l+R+');
	define('NONCE_KEY',        '5I~[pH6C{Mie;].+4-Syos;M_N4o?Spgh8`+jLy8(a#p>JLf;) )f svZWXktWeN');
	define('AUTH_SALT',        'C4:i=Mto;fw6U{H}rq`~3*5E{;-K#NemL(:3xs*+ONtOM--/f!JwF?kAf-rqz}iY');
	define('SECURE_AUTH_SALT', 'NBLnw~4wMEVOEviH8@ue[wyIl9,|T%giqZ[qJRGRs^+uo#NN&_p|tTqSz^Kj{%q)');
	define('LOGGED_IN_SALT',   'e-qFm(O`MyH]rBqE9U3$}LLf`w[|HU2=?4}x2x{@:,KYKnL+KGO|8]k.w:0?EVZV');
	define('NONCE_SALT',       'j)HtU#q|l=$bjWVqM=&Ma{Wq~64?fOz)SW63T=uO2-Qs+-VK.63rnf0:iJsT@3J(');
	

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

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
 * @link https://wordpress.org/documentation/article/debugging-in-wordpress/
 */
// Enable WP_DEBUG mode
define('WP_DEBUG', true);

// Enable Debug logging to the /wp-content/debug.log file
define('WP_DEBUG_LOG', true);

// Disable display of errors and warnings
define('WP_DEBUG_DISPLAY', false);
@ini_set('display_errors', 0);

// Log all PHP errors to /wp-content/debug.log
define('SCRIPT_DEBUG', true);


/* Add any custom values between this line and the "stop editing" line. */


/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';

// WP Offload Media Settings
define('AS3CF_SETTINGS', serialize(array(
    'provider' => 'aws',
    'bucket' => getenv('S3_UPLOADS_BUCKET'),
    'region' => 'us-east-1',
	'use-server-roles' => true,
	'copy-to-s3' => true,
	'enable-object-prefix' => true,
	'object-prefix' => 'wp-content/uploads/'
)));


define('WP_ALLOW_REPAIR', true);

