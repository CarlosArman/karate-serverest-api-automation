function fn() {
    // ------------------------------------------------------------
    // 1) Ambiente actual
    // ------------------------------------------------------------
    var env = karate.env ? karate.env.trim().toLowerCase() : 'dev';

    // ------------------------------------------------------------
    // 2) Configuración por ambiente
    // ------------------------------------------------------------
    var configByEnv = {
        dev: {
            baseUrl: 'https://serverest.dev',
            ssl: true,
            connectTimeout: 10000,
            readTimeout: 10000,
            emailDomain: 'dev.leoreal.pe'
        },
        uat: {
            baseUrl: 'https://serverest.dev',
            ssl: true,
            connectTimeout: 10000,
            readTimeout: 10000,
            emailDomain: 'uat.leoreal.pe'
        },
        prod: {
            baseUrl: 'https://serverest.dev',
            ssl: false,
            connectTimeout: 15000,
            readTimeout: 15000,
            emailDomain: 'prod.leoreal.pe'
        }
    };

    // ------------------------------------------------------------
    // 3) Validación del ambiente
    // ------------------------------------------------------------
    var envConfig = configByEnv[env];

    if (!envConfig) {
        karate.fail(
            'Ambiente no soportado: "' + env + '". ' +
            'Ambientes válidos: ' + Object.keys(configByEnv).join(', ')
        );
    }

    // ------------------------------------------------------------
    // 4) Configuración global de Karate
    // ------------------------------------------------------------
    karate.configure('ssl', envConfig.ssl);
    karate.configure('connectTimeout', envConfig.connectTimeout);
    karate.configure('readTimeout', envConfig.readTimeout);
    karate.configure('retry', {count: 2, interval: 1000});

    karate.configure('headers', function () {
        return {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
        };
    });

    karate.configure('logPrettyRequest', true);
    karate.configure('logPrettyResponse', true);

    // ------------------------------------------------------------
    // 5) Cargar helpers externos
    // ------------------------------------------------------------
    var helpers = karate.read('classpath:helpers/data-generator.js')();

    // ------------------------------------------------------------
    // 6) Config final expuesta a los features
    // ------------------------------------------------------------
    var config = {
        env: env,
        baseUrl: envConfig.baseUrl,
        ssl: envConfig.ssl,
        connectTimeout: envConfig.connectTimeout,
        readTimeout: envConfig.readTimeout,
        emailDomain: envConfig.emailDomain,

        // Helpers expuestos globalmente
        uuid: helpers.uuid,
        shortUuid: helpers.shortUuid,
        timestamp: helpers.timestamp,
        sanitizeText: helpers.sanitizeText,
        makeName: helpers.makeName,


        makeEmail: function (prefix) {
            return helpers.makeEmail(prefix, envConfig.emailDomain);
        },

        fakeFirstName: helpers.fakeFirstName,
        fakeLastName: helpers.fakeLastName,
        fakeFullName: helpers.fakeFullName,
        fakePassword: helpers.fakePassword,
        fakeBoolean: helpers.fakeBoolean,

        fakeEmail: function () {
            return helpers.fakeEmail(null, envConfig.emailDomain);
        },

        fakeUser: function () {
            return helpers.fakeUser(envConfig.emailDomain);
        },

        fakeUserCustom: function (isAdmin) {
            return helpers.fakeUserCustom(envConfig.emailDomain, isAdmin);
        }
    };

    // ------------------------------------------------------------
    // 7) Logs de inicio
    // ------------------------------------------------------------
    karate.log('====================================================');
    karate.log('Karate config cargada correctamente');
    karate.log('Ambiente   :', config.env);
    karate.log('Base URL   :', config.baseUrl);
    karate.log('SSL        :', config.ssl);
    karate.log('Timeouts   :', 'connect=' + config.connectTimeout + ', read=' + config.readTimeout);
    karate.log('====================================================');

    return config;
}
