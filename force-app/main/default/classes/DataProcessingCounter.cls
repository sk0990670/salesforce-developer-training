public class DataProcessingCounter {
    private Integer totalRecordsProcessed = 0;
    private Integer successCount = 0;
    private Integer errorCount = 0;

    public void processRecord(Decimal amount, Boolean isSuccess) {
        totalRecordsProcessed++;
        if (isSuccess) {
            successCount++;
        } else {
            errorCount++;
        }
    }

    public Integer getProcessingStats() {
        return totalRecordsProcessed;
    }

    public void resetCounters() {
        totalRecordsProcessed = 0;
        successCount = 0;
        errorCount = 0;
    }
}