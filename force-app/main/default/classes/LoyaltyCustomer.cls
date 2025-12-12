public class LoyaltyCustomer {
    public String name;
    public String email;
    public Integer pointsBalance;
    public String membershipLevel;

    public LoyaltyCustomer(String customerName, String customerEmail) {
        if (String.isBlank(customerName)) {
            this.name = 'Unknown Customer';
            System.debug('Warning: Customer name is null or empty. Setting to "Unknown Customer".');
        } else {
            this.name = customerName;
        }

        if (customerEmail.contains('@') && customerEmail.contains('.')) {
            this.email = customerEmail;
        } else {
            this.email = 'no-email@example.com';
            System.debug('Warning: Invalid email address. Setting to "no-email@example.com".');
        }

        this.pointsBalance = 0;
        this.membershipLevel = 'Bronze';
    }

    public Boolean addPoints(Integer points) {
        if (points == null || points <= 0) {
            System.debug('Error: Points must be positive and non-null.');
            return false;
        }

        if (points >= 100000) {
            System.debug('Error: Excessive points. Points should be less than 100,000 per transaction.');
            return false;
        }

        this.pointsBalance += points;
        this.determineMembershipLevel();
        System.debug('Points added successfully. New balance: ' + this.pointsBalance);
        return true;
    }

    public Boolean redeemPoints(Integer points) {
        if (points == null || points <= 0) {
            System.debug('Error: Points must be positive and non-null.');
            return false;
        }

        if (this.pointsBalance < points) {
            System.debug('Error: Insufficient points. Current balance: ' + this.pointsBalance);
            return false;
        }

        this.pointsBalance -= points;
        this.determineMembershipLevel();
        System.debug('Points redeemed successfully. New balance: ' + this.pointsBalance);
        return true;
    }

    public String determineMembershipLevel() {
        if (this.pointsBalance >= 5000) {
            this.membershipLevel = 'Gold';
        } else if (this.pointsBalance >= 1000) {
            this.membershipLevel = 'Silver';
        } else {
            this.membershipLevel = 'Bronze';
        }
        return this.membershipLevel;
    }

    public String getCustomerSummary() {
        return this.name + ' (' + this.email + ') - ' + this.membershipLevel + ' Member - ' + this.pointsBalance + ' points';
    }

    public Integer getPointsToNextLevel() {
        if (this.membershipLevel == 'Bronze') {
            return 1000 - this.pointsBalance;
        } else if (this.membershipLevel == 'Silver') {
            return 5000 - this.pointsBalance;
        } else {
            return 0;
        }
    }

    public Boolean isEligibleForRedemption(Integer points) {
        return this.pointsBalance >= points;
    }
}