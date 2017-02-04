

/**
 * MainCtrl - controller
 * Contains several global data used in different view
 *
 */
function MainCtrl($http, $scope, $rootScope) {
    /**
     * countries - Used as duallistbox in form advanced view
     */

    $http.get('/viventor/js/config.properties').then(function (response) {
        $rootScope.ACCOUNT_API_URL=response.data.ACCOUNT_API_URL;
    });


    $rootScope.$on('reloadEvent', function(event) {
         $scope.reloadPage();
    });

     $scope.getAccountTransactions = function() {
         return $http.get('//'+$rootScope.ACCOUNT_API_URL+'/v1/accounts/'+$rootScope.accountId+'/transactions')
         .then(function(response){
           $scope.transactions = response.data;
         });
     };

     $scope.getAccountData = function(val) {
       if($scope.user_accounts !== undefined){
         return $http.get('//'+$rootScope.ACCOUNT_API_URL+'/v1/accounts/'+$rootScope.accountId).then(function(response){
           $scope.account_data = response.data;
         });
       }
     };

     $scope.getUserAccounts = function(val) {
         return $http.get('//'+$rootScope.ACCOUNT_API_URL+'/v1/users/'+val+'/accounts').then(function(response){
           $scope.user_accounts = response.data;
         });
     };

     $scope.changeAccount = function() {
        $rootScope.accountId = $scope.selectedItem;
        $scope.reloadPage();
     };

     $scope.reloadPage = function() {
         $scope.getAccountData();
         $scope.getUserAccounts(6);
     };

}



/**
 * modalDemoCtrl - Controller used to run modal view
 * used in Basic form view
 */
function modalDemoCtrl($scope, $uibModal, $log, $rootScope) {

    $scope.open = function () {

        var modalInstance = $uibModal.open({
            templateUrl: 'views/modal_example.html',
            controller: ModalInstanceCtrl,
            scope: $scope,
                resolve: {
                    deposit: function () {
                        return $scope.deposit;
                    }
                }
        });
        modalInstance.result.then(function (items) {
               $scope.items = items;
           }, function () {
               $log.info('Modal dismissed at: ' + new Date());
        });
    };

    $scope.open1 = function () {
      var modalInstance = $uibModal.open({
          templateUrl: 'views/modal_example0.html',
          controller: ModalInstanceCtrl,
          scope: $scope,
              resolve: {
                  deposit: function () {
                      return $scope.deposit;
                  }
              }
      });
      modalInstance.result.then(function (items) {
             $scope.items = items;
         }, function () {
             $log.info('Modal dismissed at: ' + new Date());
      });
    };

    $scope.open2 = function () {
        var modalInstance = $uibModal.open({
            templateUrl: 'views/modal_example2.html',
            controller: ModalInstanceCtrl,
            windowClass: "animated fadeIn"
        });
    };

    $scope.open3 = function (size) {
        var modalInstance = $uibModal.open({
            templateUrl: 'views/modal_example3.html',
            size: size,
            controller: ModalInstanceCtrl
        });
    };

    $scope.open4 = function () {
        var modalInstance = $uibModal.open({
            templateUrl: 'views/modal_example2.html',
            controller: ModalInstanceCtrl,
            windowClass: "animated flipInY"
        });
    };
};

function ModalInstanceCtrl ($scope, $uibModalInstance, deposit, $http, $rootScope) {

    $scope.form = {};

    $scope.ok = function () {
        $uibModalInstance.close();
    };

    $scope.cancel = function () {
        $uibModalInstance.dismiss('cancel');
    };

    $scope.submitDeposit = function () {
      if(confirm("Do you want to confirm this deposit transaction, ammount: "+$scope.form.deposit.amount.$modelValue)){
        $http({
          method : "POST",
          url : "http://"+$rootScope.ACCOUNT_API_URL+"/v1/transactions/deposit",
          data :
            {
            	"accountid": Number($rootScope.accountId),
            	"operationtypeid": 1,
                "detail": $scope.form.deposit.detail.$modelValue,
                "origin": "some origin",
                "destiny": "some destiny",
                "amount": $scope.form.deposit.amount.$modelValue,
                "declarationsList": []
            },
            headers : {
                'Content-Type' : 'application/json'
            }
          })
          .then(function(response) {
                alert('Transaction sucessful, current balance:  '+response.data.balance);
                $rootScope.$emit('reloadEvent');
          },
          function(response) { // optional
                  alert('Transaction failed: '+response.message);
          });
        }
      };

      $scope.submitWithdraw = function () {
        if(confirm("Do you want to confirm this withdraw transaction, ammount: "+$scope.form.deposit.amount.$modelValue)){
          $http({
            method : "POST",
            url : ""+$rootScope.ACCOUNT_API_URL+"/v1/transactions/withdraw",
            data :
              {
                "accountid": Number($rootScope.accountId),
                "operationtypeid": 1,
                  "detail": $scope.form.deposit.detail.$modelValue,
                  "origin": "some origin",
                  "destiny": "some destiny",
                  "amount": $scope.form.deposit.amount.$modelValue,
                  "declarationsList": []
              },
              headers : {
                  'Content-Type' : 'application/json'
              }
          })
          .then(function(response) {
                alert('Transaction sucessful, current balance:  '+response.data.balance);
                $rootScope.$emit('reloadEvent');
          },
          function(response) { // optional
                  alert('Transaction failed: '+response.data.message);
          });
        }
        };



};

/**
 *
 * Pass all functions into module
 */
angular
    .module('inspinia')
    .controller('MainCtrl', MainCtrl)
    .controller('Viventor', 'Viventor')
    .controller('modalDemoCtrl', modalDemoCtrl);
