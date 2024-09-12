# To learn more about how to use Nix to configure your environment
# see: https://developers.google.com/idx/guides/customize-idx-env
{ pkgs }: {
  # Which nixpkgs channel to use.
  channel = "stable-23.11"; # or "unstable"
  # Use https://search.nixos.org/packages to find packages
  packages = [
    # pkgs.php82
    (pkgs.php82.buildEnv {
      extensions = ({ enabled, all }: enabled ++ (with all;[
        apcu
        bcmath
        # brotli
        bz2
        calendar
        # Core
        ctype
        curl
        # date
        dom
        ds
        exif
        fileinfo
        filter
        ftp
        # geoip
        gettext
        # hash
        iconv
        igbinary
        imap
        intl
        # json
        # libxml
        # lua
        mbstring
        mongodb
        msgpack
        mysqli
        mysqlnd
        openssl
        pcntl
        # pcre
        # PDO
        pdo
        pdo_mysql
        pdo_pgsql
        pdo_sqlite
        pgsql
        phalcon
        # Phar
        protobuf
        readline
        redis
        # Reflection
        # runkit7
        session
        # SimpleXML
        simplexml
        soap
        sockets
        sodium
        # SPL
        sqlite3
        # standard
        swoole
        # timecop
        tokenizer
        # uuid
        xml
        xmlreader
        # xmlrpc
        xmlwriter
        xsl
        # Zend
        # OPcache
        opcache
        zlib
        zip
      ]));
    })
    pkgs.php82Packages.composer
    pkgs.nodejs_20
    pkgs.openssl
  ];
  # Sets environment variables in the workspace
  env = { };
  idx = {
    # Search for the extensions you want on https://open-vsx.org/ and use "publisher.id"
    extensions = [
      # "vscodevim.vim"
    ];
    workspace = {
      # Runs when a workspace is first created with this `dev.nix` file
      onCreate = {
        # Example: install JS dependencies from NPM
        # npm-install = "npm install";
        # Open editors for the following files by default, if they exist:
        default.openFiles = [ "README.md" "resources/views/welcome.blade.php" ];
      };
      # To run something each time the workspace is (re)started, use the `onStart` hook
    };
    # Enable previews and customize configuration
    previews = {
      enable = true;
      previews = {
        web = {
          command = [ "php" "artisan" "serve" "--port" "$PORT" "--host" "0.0.0.0" ];
          manager = "web";
        };
      };
    };
  };
}
