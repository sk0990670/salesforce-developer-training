public class Developer extends Employee {
    private List<String> programmingLanguages;
    private String specialization;
    private Integer projectsCompleted;
    private Decimal skillBonus;

    public Developer(String fname, String lname, String dept, Decimal salary, String spec){
        super(fname, lname, dept, salary);

        spec = (spec == null) ? 'Full-Stack' : spec;
        Set<String> validSpecs = new Set<String>{'Frontend','Backend','Full-Stack','DevOps'};
        if(!validSpecs.contains(spec)){
            spec = 'Full-Stack';
        }
        this.specialization       = spec;
        this.programmingLanguages = new List<String>();
        this.projectsCompleted    = 0;

        Map<String,Decimal> mapBonus = new Map<String,Decimal>{
            'Frontend'   => 2000,
            'Backend'    => 3000,
            'Full-Stack' => 5000,
            'DevOps'     => 4000
        };
        this.skillBonus = mapBonus.get(spec);
    }

    public override Decimal calculateAnnualPay(){
        Decimal projBonus   = this.projectsCompleted * 1000;
        Decimal langBonus   = this.programmingLanguages.size() * 500;
        Decimal totalBonus  = this.skillBonus + projBonus + langBonus;

        // senior bonus
        if(this.programmingLanguages.size() >= 5 && this.projectsCompleted >= 10){
            totalBonus += this.baseSalary * 0.10;
        }

        // cap bonuses at 40% of base
        Decimal maxBonus = this.baseSalary * 0.40;
        totalBonus = Math.min(totalBonus, maxBonus);

        return this.baseSalary + totalBonus;
    }

    public override String getEmployeeInfo(){
        return super.getEmployeeInfo() +
               ' - Developer (' + this.specialization + ') - Skill Bonus: $' +
               this.skillBonus.setScale(2);
    }

    public Boolean addProgrammingLanguage(String lang){
        if(String.isBlank(lang)){ return false; }
        lang = lang.trim().toLowerCase();
        lang = lang.substring(0,1).toUpperCase() + lang.substring(1);
        if(programmingLanguages.contains(lang)){
            return false;
        }
        programmingLanguages.add(lang);
        return true;
    }

    public void completeProject(){
        this.projectsCompleted++;
        System.debug('Project completed. Total: ' + this.projectsCompleted);
    }
}