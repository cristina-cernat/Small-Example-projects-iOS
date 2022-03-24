class Company {
    //1
    init(name: String) {
        self.name = name
    }

    var name: String

    //3
    deinit {
        print("I passed away")
    }
}



struct Organisation {
    var name: String
}

struct Employee {
    var firstName: String
    var lastName: String
    var lastJob: Company
}

//2
let firstCompany = Company(name: "Endava") //reference type
let firstOrganisation = Organisation(name: "Apple") // value type

//firstOrganisation.name = "Google" - cannot be done
firstCompany.name = "Google" //reference is not changed
// firstCompany = Company(name: "Facebook") //reference is changed

var me = Employee(firstName: "Marin", lastName: "Novitchi", lastJob: Company(name: "Endava"))
var you = me

you.firstName = "Rona"
you.lastName = "Bompa"
you.lastJob.name = "Apple"

print(you.lastJob.name) //Apple
print(me.lastJob.name) //Apple

