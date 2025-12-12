public class SalesRep extends Employee {
    private Decimal salesTarget;
    private Decimal currentSales;
    private Decimal commissionRate;
    private String territory;
    private List<String> majorClients;

    public SalesRep(String fname, String lname, Decimal salary, Decimal target, Decimal commRate, String terr){
        super(fname, lname, 'Sales', salary);

        target = (target == null || target < 50000 || target > 10000000) ? 50000 : target;
        commRate = (commRate == null || commRate < 0 || commRate > 20) ? 0 : commRate;
        terr = String.isBlank(terr) ? 'Unassigned' : terr;

        this.salesTarget   = target;
        this.commissionRate = commRate;
        this.territory      = terr;
        this.currentSales   = 0;
        this.majorClients   = new List<String>();
    }

    public override Decimal calculateAnnualPay(){
        Decimal commission = this.currentSales * (this.commissionRate / 100);
        Decimal bonus = 0;

        Decimal achievement = this.currentSales / this.salesTarget;
        if(achievement >= 1){
            bonus += this.baseSalary * 0.05; // 5% base bonus
            Decimal over = achievement - 1;
            bonus += this.baseSalary * (Math.floor(over * 10) * 0.02); // 2% per 10%
        }
        return this.baseSalary + commission + bonus;
    }

    public override String getEmployeeInfo(){
        return super.getEmployeeInfo() +
               ' - Sales Rep (' + this.territory + ')';
    }

    public Boolean recordSale(Decimal amount, String client){
        if(amount == null || amount <= 0 || amount > 1000000){ return false; }
        if(String.isBlank(client)){ return false; }

        this.currentSales += amount;
        if(amount > 10000 && !majorClients.contains(client)){
            majorClients.add(client);
        }
        System.debug('Sale recorded: $' + amount + ' from ' + client);
        return true;
    }

    public String getSalesPerformance(){
        Decimal pct = (this.salesTarget == 0) ? 0 : (this.currentSales / this.salesTarget * 100);
        Decimal commission = this.currentSales * (this.commissionRate / 100);
        return 'Sales: $' + this.currentSales.setScale(2) +
               ' / $' + this.salesTarget.setScale(2) +
               ' (' + pct.setScale(1) + '%) - Commission: $' + commission.setScale(2) +
               ' - Major Clients: ' + majorClients.size();
    }
}