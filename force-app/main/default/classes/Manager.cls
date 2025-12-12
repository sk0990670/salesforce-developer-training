public class Manager extends Employee {
    private List<String> teamMembers;
    private Integer teamSize;
    private Decimal managementBonus;

    public Manager(String fname, String lname, String dept, Decimal salary, Decimal bonus) {
        super(fname, lname, dept, salary);

        bonus = (bonus == null || bonus < 0) ? 0 : bonus;
        if (bonus > salary * 0.5) {
            bonus = salary * 0.5;
            System.debug('Warning: bonus capped at 50% of base salary');
        }
        this.managementBonus = bonus;
        this.teamMembers = new List<String>();
        this.teamSize = 0;
    }

    public override Decimal calculateAnnualPay() {
        Decimal teamBonus = this.teamSize * 500;
        Decimal total = this.baseSalary + this.managementBonus + teamBonus;
        if (this.teamSize >= 10) {
            total *= 1.05; // 5% extra for large teams
        }
        return total;
    }

    public override String getEmployeeInfo() {
        return super.getEmployeeInfo() +
               ' - Manager (Team: ' + this.teamSize + ') - Mgmt Bonus: $' +
               this.managementBonus.setScale(2);
    }

    public Boolean addTeamMember(String empId) {
        if (String.isBlank(empId) || !empId.startsWith('EMP')) {
            return false;
        }
        if (this.teamMembers.contains(empId)) {
            System.debug('Already on team');
            return false;
        }
        if (this.teamSize >= 20) {
            System.debug('Team full');
            return false;
        }
        teamMembers.add(empId);
        teamSize = teamMembers.size();
        return true;
    }

    public Boolean removeTeamMember(String empId) {
        Integer index = teamMembers.indexOf(empId);
        Boolean removed = false;
        if (index != -1) {
            teamMembers.remove(index);
            teamSize = teamMembers.size();
            removed = true;
        } else {
            System.debug('Employee not on team');
        }
        return removed;
    }

    public String getTeamSummary() {
        if (teamMembers.isEmpty()) {
            return 'Team Size: 0 - No team members';
        }
        return 'Team Size: ' + teamSize + ' - Members: ' + JSON.serialize(teamMembers);
    }
}