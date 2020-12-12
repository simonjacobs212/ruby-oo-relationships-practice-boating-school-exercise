class Instructor
    attr_reader :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def find_test(student, test_name)
        BoatingTest.all.find { |test| test.test_name == test_name && test.student == student }
    end

    def pass_student(student, test_name)
        test_found = find_test(student, test_name)
        if test_found
            test_found.test_status = "passed"
            test_found
        else
            BoatingTest.new(student, test_name, "passed", self)
        end
    end

    def fail_student(student, test_name)
        test_found = find_test(student, test_name)
        if test_found
            test_found.test_status = "failed"
            test_found
        else
            BoatingTest.new(student, test_name, "failed", self)
        end
    end

    def instructor_tests
       BoatingTest.all.select { |test| test.instructor == self }
    end

    def all_students
        self.instructor_tests.map { |test| test.student }
    end

    def passed_students
        filtered_tests = self.instructor_tests.filter { |test| test.test_status == "passed" }
        filtered_tests.map { |test| test.student }
    end
end