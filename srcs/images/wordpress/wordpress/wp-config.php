<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'iharchi' );

/** MySQL database password */
define( 'DB_PASSWORD', 'wppassword' );

/** MySQL hostname */
define( 'DB_HOST', 'mysql' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
	define('AUTH_KEY',         'P6Nw}_tsDn3%;,*w`i1o]h8VO!j]?p-OI{p+GAKx~!xB^Z[/XUzOwM/GnJ;+?CCA');
	define('SECURE_AUTH_KEY',  'q)h_AdjLA9FGIx,&!0RN%Ve.shDJ@[;$+mf/7iLOb]v%W>+xQB<<PoJL-FQR-c`r');
	define('LOGGED_IN_KEY',    'HieAdQtl_9zKN>3G]{<xr7d?C5<HIy5sa}rXnTO*g53CXowzfL4=(HBL;H^pv1UM');
	define('NONCE_KEY',        '*64l}kZIzB0qUNQ/oB(V/3 g7-,<|*-?a5g=R1VXZ> [~x^Lq+p/UooJ;_0N,bp;');
	define('AUTH_SALT',        ']%%pN0gauGj-LW*RT5:a$gw9HVqtcTMX3K!@z:9I/f2|AJ6=Mj_{z|mET%(3]n3,');
	define('SECURE_AUTH_SALT', ']pdE01O6<2h5-|(:Ti[e|&dX+t>p31SQ.,B_zotipw3Y+z$A wXX5}+LT;Q+@Bud');
	define('LOGGED_IN_SALT',   '9SFFTK[3DZYuo+Ip($t-Or4a}zwqYR%?3+|#SJ47o9nXWdZw|q3(=>#ziBCFpn{=');
	define('NONCE_SALT',       'h>.D/-h.~Ubfs>q%{hS|1j=SQz=dW0)~D-Et&CL|3YaO~F]G[Uip@Df}c+0lw3qa');

/**#@-*/

/**
 * WordPress Database Table prefix.
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
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', true );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
