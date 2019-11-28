-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "DEPARTMENTS" (
    "DEPT_NO" string   NOT NULL,
    "DEPT_NAME" string   NOT NULL,
    CONSTRAINT "pk_DEPARTMENTS" PRIMARY KEY (
        "DEPT_NO"
     )
);

CREATE TABLE "DEPT_EMP" (
    "EMP_NO" int   NOT NULL,
    "DEPT_NO" string   NOT NULL,
    "FROM_DATE" date   NOT NULL,
    "TO_DATE" date   NOT NULL
);

CREATE TABLE "DEPT_MANAGER" (
    "DEPT_NO" string   NOT NULL,
    "EMP_NO" int   NOT NULL,
    "FROM_DATE" date   NOT NULL,
    "TO_DATE" date   NOT NULL
);

CREATE TABLE "EMPLOYEES" (
    "EMP_NO" int   NOT NULL,
    "BIRTH_DATE" date   NOT NULL,
    "FIRST_NAME" string   NOT NULL,
    "LAST_NAME" string   NOT NULL,
    "GENDER" string   NOT NULL,
    "HIRE_DATE" string   NOT NULL,
    CONSTRAINT "pk_EMPLOYEES" PRIMARY KEY (
        "EMP_NO"
     )
);

CREATE TABLE "SALARIES" (
    "EMP_NO" int   NOT NULL,
    "SALARY" money   NOT NULL,
    "FROM_DATE" date   NOT NULL,
    "TO_DATE" date   NOT NULL
);

CREATE TABLE "TITLES" (
    "EMP_NO" int   NOT NULL,
    "TITLE" string   NOT NULL,
    "FROM_DATE" date   NOT NULL,
    "TO_DATE" date   NOT NULL
);

ALTER TABLE "DEPT_EMP" ADD CONSTRAINT "fk_DEPT_EMP_EMP_NO" FOREIGN KEY("EMP_NO")
REFERENCES "EMPLOYEES" ("EMP_NO");

ALTER TABLE "DEPT_EMP" ADD CONSTRAINT "fk_DEPT_EMP_DEPT_NO" FOREIGN KEY("DEPT_NO")
REFERENCES "DEPARTMENTS" ("DEPT_NO");

ALTER TABLE "DEPT_MANAGER" ADD CONSTRAINT "fk_DEPT_MANAGER_DEPT_NO" FOREIGN KEY("DEPT_NO")
REFERENCES "DEPARTMENTS" ("DEPT_NO");

ALTER TABLE "DEPT_MANAGER" ADD CONSTRAINT "fk_DEPT_MANAGER_EMP_NO" FOREIGN KEY("EMP_NO")
REFERENCES "EMPLOYEES" ("EMP_NO");

ALTER TABLE "SALARIES" ADD CONSTRAINT "fk_SALARIES_EMP_NO" FOREIGN KEY("EMP_NO")
REFERENCES "EMPLOYEES" ("EMP_NO");

ALTER TABLE "TITLES" ADD CONSTRAINT "fk_TITLES_EMP_NO" FOREIGN KEY("EMP_NO")
REFERENCES "EMPLOYEES" ("EMP_NO");

