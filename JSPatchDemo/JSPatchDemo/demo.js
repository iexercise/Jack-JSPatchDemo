//require('UIAlertView');
//defineClass('JackTab0Controller', {
//            jspatchTest: function() {
//            var alert = UIAlertView.alloc().initWithTitle_message_delegate_cancelButtonTitle_otherButtonTitles("www", "www", null, null, null, null);
//            alert.show();
//            },
//            });


//require('UIView,UIColor');
//defineClass('JackTab0Controller', {
//            jspatchTest: function() {
//            var redView = UIView.alloc().initWithFrame({x:100, y:100, width:100, height:100});
//            redView.setBackgroundColor(UIColor.redColor());
//            self.view().addSubview(redView);
//            },
//});


//require('UIButton');
//defineClass('JackTab0Controller', {
//            jspatchTest: function() {
//            var addBtn = UIButton.buttonWithType(5);
//            addBtn.setCenter({x: 100, y: 300});
//            self.view().addSubview(addBtn);
//            },
//            });



require('UIButton,UITableView,UITableViewCell');
defineClass('ViewController:UIViewController <UITableViewDelegate,UITableViewDataSource>', {
            jspatchTest: function() {
            
            var addBtn = UIButton.buttonWithType(5);
            addBtn.setCenter({x: 100, y: 300});
            self.view().addSubview(addBtn);
            addBtn.addTarget_action_forControlEvents(self, 'testTabelView', 1 << 6);
            },
            
            testTabelView: function() {
            var table = UITableView.alloc().init();
            table.setDelegate(self);
            table.setDataSource(self);
            var tableW = self.view().bounds().width;
            var tableH = self.view().bounds().height;
            table.setFrame({x:0, y:64, width:tableW, height:tableH});
            self.view().addSubview(table);
            },
            
            
            //tableDataSource
            tableView_numberOfRowsInSection: function(tableView, section) {
            return self.testDataArr().count();
            },
            
            tableView_cellForRowAtIndexPath: function(tableView, indexPath) {
            var cell = UITableViewCell.alloc().init();
            var data = self.testDataArr();
            var str = "JSPatch - " + data.toJS()[indexPath.row()];
            cell.textLabel().setText(str);
            return cell;
            },
            });




















