// errors

enum MathError: String, Error { // string
    case DividedByZero = "Cannot divide by zero" // raw value
    case ZeroDividedByZero = "Cannot do that either"
}

enum CompilationError: Int, Error { // we write what type is the case ??
    //
    case firstCompilation
}

func dividePi(by value: Double) throws -> Double {

    guard value != 0 else {
        throw MathError.DividedByZero // here we chose the case for enum
    }
    return Double.pi / value // inf = infinit

}

func compute() {
    do {
        let result = try dividePi(by: 0)
        print(result)
    } catch let error as MathError {
        print("error: \(error.rawValue)")
    } catch let error as CompilationError {
        //print("compilation error on number: \(error.rawValue")
    } catch {
        print("unknown error")
    }
}

compute()


// casting

enum OS{
    case macOS, windows, linux(distribution: String) // asoc value
}

class Game {
    var name: String

    init(name: String) {
        self.name = name
    }

}


class VideoGame: Game {
    var supportedOS: OS

    init(name: String, worksOn supportedOS: OS) {
        self.supportedOS = supportedOS
        super.init(name: name)
    }
}

class BoardGame: Game {
    var numberOfPlayers: Int

    init(name: String, worksOn numberOfPlayers: Int) {
        self.numberOfPlayers = numberOfPlayers
        super.init(name: name)
    }
}


func describeGame(game: Game) {
    // type casting
    if let game = game as? VideoGame{ //s-ar putea sa fie videogame, daca da, do this:
        print(game.supportedOS)
    } else {
        print("this isn't a video game")
    }
}

let openWorldGame = VideoGame(name: "GTA", worksOn: .windows)
let annoyingGame = BoardGame(name: "Monopoly", worksOn: 6)

describeGame(game: openWorldGame)
describeGame(game: annoyingGame)

// protocols

protocol Student {

    init(name: String)

    var name: String { get set }
    func provideName() -> String
}

    class EndavaStudent: Student{
    required init(name: String) {
        self.name = name
    }
    var name: String
    func provideName() -> String {
        name // return name without return bcs short function
    }
}

class BestEndavaStudent: EndavaStudent {
    var grade: Int

    init(grade: Int) {
        self.grade = grade
        super.init(name: "cris")
    }

    required init(name: String) {
        self.grade = 10
        super.init(name: name) // cand mostenim, neaparat super.
    }


 }


    let you = BestEndavaStudent(name: "cris")
    you.provideName()
