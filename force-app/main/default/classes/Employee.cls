public abstract class Employee {
    protected String employeeId;
    protected String firstName;
    protected String lastName;
    protected String department;
    protected Date hireDate;
    protected Decimal baseSalary;
    protected String email;

    /* ---------- Constructor ---------- */
    public Employee(String fname, String lname, String dept, Decimal salary){
        if(String.isBlank(fname)){
            throw new IllegalArgumentException('First name cannot be null or empty');
        }
        if(String.isBlank(lname)){
            throw new IllegalArgumentException('Last name cannot be null or empty');
        }
        if(salary == null || salary < 30000 || salary > 500000){
            throw new IllegalArgumentException('Base salary must be between $30,000 and $500,000');
        }

        this.employeeId   = 'EMP' + String.valueOf(System.now().getTime());
        this.firstName    = fname;
        this.lastName     = lname;
        this.department   = isValidDepartment(dept) ? dept : 'General';
        this.hireDate     = Date.today();
        this.baseSalary   = salary;
        this.email        = (fname + '.' + lname).toLowerCase() + '@company.com';
    }

    private Boolean isValidDepartment(String d){
        return new Set<String>{'Engineering','Sales','Marketing','HR','Finance'}.contains(d);
    }

    /* ---------- Instance methods ---------- */
    public virtual Decimal calculateAnnualPay(){
        return this.baseSalary;
    }

    public virtual String getEmployeeInfo(){
        return this.firstName + ' ' + this.lastName +
               ' (' + this.employeeId + ') - ' + this.department +
               ' - Hired: ' + this.hireDate.format() +
               ' - Annual Pay: $' + this.baseSalary.setScale(2);
    }

    public Integer getYearsOfService(){
        if(this.hireDate > Date.today()){
            System.debug('Warning: hire date is in the future');
            return 0;
        }
        return Date.today().year() - this.hireDate.year();
    }

    public Boolean promoteEmployee(String newDept, Decimal increase){
        if(!isValidDepartment(newDept)){ return false; }
        if(increase == null || increase <= 0 || this.baseSalary + increase > 500000){
            return false;
        }
        this.department  = newDept;
        this.baseSalary += increase;
        System.debug('Promotion: ' + this.firstName + ' moved to ' + newDept + ' with $' + increase + ' raise');
        return true;
    }
}