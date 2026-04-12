function fn() {
    var Faker = Java.type('net.datafaker.Faker');
    var Locale = Java.type('java.util.Locale');
    var UUID = Java.type('java.util.UUID');
    var System = Java.type('java.lang.System');

    var faker = new Faker(new Locale('es'));

    function uuid() {
        return UUID.randomUUID().toString();
    }

    function shortUuid() {
        return UUID.randomUUID().toString().replace(/-/g, '').substring(0, 8);
    }

    function timestamp() {
        return System.currentTimeMillis();
    }

    function sanitizeText(text) {
        if (!text) {
            return '';
        }
        return String(text)
            .trim()
            .toLowerCase()
            .replace(/\s+/g, '_')
            .replace(/[^\w.]/g, '');
    }

    function makeEmail(prefix, domain) {
        prefix = prefix || 'user';
        domain = domain || 'leoreal.pe';

        var cleanPrefix = sanitizeText(prefix);
        var unique = shortUuid();

        return cleanPrefix + '_' + unique + '@' + domain;
    }

    function makeName(prefix) {
        prefix = prefix || 'automation';
        var cleanPrefix = sanitizeText(prefix);
        var unique = shortUuid();
        return cleanPrefix + '_' + unique;
    }

    function fakeFirstName() {
        return faker.name().firstName();
    }

    function fakeLastName() {
        return faker.name().lastName();
    }

    function fakeFullName() {
        return faker.name().fullName();
    }

    function fakePassword(minLength, maxLength) {
        minLength = minLength || 8;
        maxLength = maxLength || 12;
        return faker.internet().password(minLength, maxLength, true, true, true);
    }

    function fakeBoolean() {
        return faker.bool().bool();
    }

    function fakeEmail(prefix, domain) {
        var fullName = fakeFullName();
        prefix = prefix || sanitizeText(fullName);
        domain = domain || 'leoreal.pe';
        var unique = shortUuid().substring(0, 6);

        return prefix + '.' + unique + '@' + domain;
    }

    function fakeUser(domain) {
        domain = domain || 'leoreal.pe';

        var fullName = fakeFullName();
        console.log(fullName);
        var prefix = sanitizeText(fullName);
        console.log(prefix);
        return {
            nome: fullName,
            email: fakeEmail(prefix, domain),
            password: fakePassword(8, 12),
            administrador: String(fakeBoolean())
        };
    }

    function fakeUserCustom(domain, isAdmin) {
        domain = domain || 'leoreal.pe';
        isAdmin = (typeof isAdmin === 'undefined') ? fakeBoolean() : isAdmin;

        var fullName = fakeFullName();
        var prefix = sanitizeText(fullName);

        return {
            nome: fullName,
            email: fakeEmail(prefix, domain),
            password: fakePassword(8, 12),
            administrador: String(isAdmin)
        };
    }

    return {
        uuid: uuid,
        shortUuid: shortUuid,
        timestamp: timestamp,
        sanitizeText: sanitizeText,
        makeEmail: makeEmail,
        makeName: makeName,
        fakeFirstName: fakeFirstName,
        fakeLastName: fakeLastName,
        fakeFullName: fakeFullName,
        fakePassword: fakePassword,
        fakeBoolean: fakeBoolean,
        fakeEmail: fakeEmail,
        fakeUser: fakeUser,
        fakeUserCustom: fakeUserCustom
    };
}