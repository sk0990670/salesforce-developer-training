trigger AccountTrigger on Account (before insert, after insert) {

    List<Account> newAccountList = Trigger.new;

    switch on Trigger.operationType {
        when BEFORE_INSERT {
            for (Account acc : newAccountList) {
                acc.Name        = acc.Name?.toUpperCase();
                acc.Description = acc.Description?.toUpperCase();

                if (String.isBlank(acc.Phone)) {
                    acc.Phone.addError('Phone is required.');
                }
                if (String.isBlank(acc.Fax)) {
                    acc.Fax.addError('Fax is required.');
                }
                if (String.isBlank(acc.Website)) {
                    acc.Website.addError('Website is required.');
                }
                if (String.isBlank(acc.Rating)) {
                    acc.Rating.addError('Rating is required.');
                }
            }
        }

        when AFTER_INSERT {
            List<Task> tasksTobeCreated = new List<Task>();
            for (Account acc : newAccountList) {
                tasksTobeCreated.add(
                    new Task(
                        Subject      = 'Created from Apex Trigger ' + acc.Name,
                        Description  = 'Created from Apex Trigger ' + acc.Name,
                        ActivityDate = System.today().addDays(7),
                        Status       = 'Not Started',
                        Priority     = 'High',
                        WhatId       = acc.Id,
                        OwnerId      = acc.OwnerId
                    )
                );
            }
            insert tasksTobeCreated;
        }

        when else {
            System.debug('No Event is Implemented');
        }
    }
}