class Student

    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_student(name)
        self.all.find {|student| student.name == name}
    end

    def add_boating_test(test_name, test_status, instructor)
        BoatingTest.new(self, test_name, test_status, instructor)
    end

    def student_tests
        BoatingTest.all.select { |test| test.student == self }
    end

    def all_instructors
        self.student_tests.map { |test| test.instructor }
    end

    def grade_percentage
        passed_tests = self.student_tests.filter { |test| test.test_status == "passed" }
        (passed_tests.count.to_f / self.student_tests.count.to_f) * 100.0
    end
end
