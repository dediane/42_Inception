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
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'MYSQL_DATABASE');

/** Database username */
define( 'DB_USER', 'MYSQL_USER');

/** Database password */
define( 'DB_PASSWORD', 'MYSQL_PASSWORD');

/** Database hostname */
define( 'DB_HOST', 'WP_DBHOST');

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
define('AUTH_KEY',         '&/Gx/A-KHGsU6S0CUKVq(Wf-HC)~~~qi/y?SESi.ds:yeE/Xea<n*Y2J;%uh>P:o');
define('SECURE_AUTH_KEY',  '$uDhlP|[_z71|)2Ri{SyBCV.RC@$NS*=S)w8Ji,sOI~%a~9>kI=r]KKT7#97B%D@');
define('LOGGED_IN_KEY',    'LgnO*:!tM%3F>g{TL5>].P)HoA}~y-ucpR?q2avZN%f7+GQ?@uo-)M#||7^dK(Wx');
define('NONCE_KEY',        'g^ZlQWrBOo|SoX;60xYq|E2M=k+<p2dac_sioo0p_0F#%sf&Jbv4b]ON&fSa>h50');
define('AUTH_SALT',        ':f:2/:8T]2p.I?wjEgA<Ds#[QNr+#}R$F`9%Mk;ym|bM0#swV~->85b$:.S6*stU');
define('SECURE_AUTH_SALT', ')N>JdLsH/]>FLB!YVU4y6l_8;-h?v$n!5<SO9yR{p/GWs+ [gI?o^J0-(Eb$OUJM');
define('LOGGED_IN_SALT',   '4uK$-Ij_1Vk#bB^mttF3+3VErD)gBLk4s+jRA80~{gTTR9=R6uC,yO0f*Z2TrdwT');
define('NONCE_SALT',       'kLgGI[nuJQN0>|*qU4>yh6|PYZhJp0i@+-!&GG_$}*L%.|w^>1d]R~}]U3L,|qsT');
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
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
        define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';