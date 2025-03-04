public class RandomDataGenerator {

    /* Get random number. */
    public Integer GetRandomNumber(Integer multiplier) {
        return Integer.valueof(Math.random() * multiplier);
    }

    /* Generate a random full name */
    public String GenerateRandomFullName() {
        Integer randomInitialIndex = GetRandomNumber(Names.Initials.size() - 1);
        String randomFullName = GenerateRandomFirstName() + ' ' + Names.Initials[randomInitialIndex] + '. ' + GenerateRandomLastName();
        return randomFullName;
    }

    /* GenerateRandomFirstName - returns a random first name. */
    public String GenerateRandomFirstName() {
        Integer randomFirstNameIndex = GetRandomNumber(Names.FirstNames.size() - 1);
        return Names.FirstNames[randomFirstNameIndex];
    }
    
    /* Generate a random last name. */
    public String GenerateRandomLastName() {
        Integer randomLastNameIndex = GetRandomNumber(Names.LastNames.size() - 1);
        return Names.LastNames[randomLastNameIndex];
    }
    
    /* Generate random phone number. */
    public String GenerateRandomPhone() {
        String randomAreaCode = String.valueOf(GetRandomNumber(1000));
        String randomMiddleBit = String.valueOf(GetRandomNumber(1000));
        String randomLastBit = String.valueOf(GetRandomNumber(100000));
        return '(' + randomAreaCode + ') ' + randomMiddleBit + ' ' + randomLastBit;
    }

    /* GenerateRandomBool - Generate random boolean. */
    public Boolean GenerateRandomBool() {
        Integer oneOrZero = GetRandomNumber(2);
        return oneOrZero == 1;
    }
    
    /* Generate a random company name. */
    public String GenerateRandomCompany() {
        Integer randomSuffixIndex = GetRandomNumber(Names.CompanySuffixes.size() - 1);
        String randomSuffix = Names.CompanySuffixes[randomSuffixIndex];
        return GenerateRandomLastName() + randomSuffix;
    }
    
    /* GenerateRandomString - Generate a random string of the specified length. */
    public String GenerateRandomString(Integer stringLength) {
        String randomString = '';

        for (Integer i = 0; i < stringLength; i++) {
            Integer randomInitialIndex = GetRandomNumber(Names.Initials.size() - 1);
            randomString += Names.Initials[randomInitialIndex];
        }

        return randomString;
    }
    
    /* Generate random string of given length */
    public String GenerateRandomStringOfMaxLength(Integer maxStringLength) {
        Integer stringLength = GetRandomNumber(maxStringLength);
        return GenerateRandomString(stringLength);
    }
}