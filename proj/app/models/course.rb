class Course < ApplicationRecord
    has_many(
        :enrollments,
        class_name: "Enrollment",
        foreign_key: :course_id,
        primary_key: :id
    )

    has_many(
        :students,
        through: :enrollments,
        source: :student
    )
end
