# Week 5 Homework: Personalized Relational Algebra

**Student:** Sai Vineesh
**Student ID:** S005
**Favorite Number:** 15

## My Data Record
```
S005, Sai Vineesh, 15, Programming languages enable developers to create software solutions for modern challenges.
```

## Part 1: Word Extraction Queries (40 points)

### Query 1: Find My Record
**Expression:** σ_{studentName = 'Sai Vineesh'}(StudentData)

**Result:** 
| student_id | studentName | favoriteNumber | randomParagraph |
|-----------|-------------|----------------|-----------------|
| S005 | Sai Vineesh | 15 | Programming languages enable developers to create software solutions for modern challenges. |

**Explanation:** This query uses the selection operator (σ) to filter the StudentData table and returns the complete row where the studentName matches 'Sai Vineesh'. All four columns are included in the result.

---

### Query 2: Extract 3rd Word
**My 3rd word:** enable

**Expression:** π_{WORD}(σ_{studentName = 'Sai Vineesh'}(StudentData), 3)

**Explanation:** First, I use selection to retrieve my record: σ_{studentName = 'Sai Vineesh'}(StudentData). Then, since pure relational algebra doesn't support string manipulation, I use a hypothetical extended function WORD(randomParagraph, 3) which extracts the 3rd word from the randomParagraph field. By projecting this function result, I obtain "enable". The word sequence is: Programming(1st) languages(2nd) enable(3rd).

---

### Query 3: Extract 7th Word
**My 7th word:** software

**Expression:** π_{WORD}(σ_{studentName = 'Sai Vineesh'}(StudentData), 7)


**Explanation:** Using the same approach as Query 2, I select my record and then project the 7th word using the extended WORD function. The word sequence is: Programming(1) languages(2) enable(3) developers(4) to(5) create(6) software(7).

---

### Query 4: Find All Students with favoriteNumber > 15
**Expression:** σ_{favoriteNumber > 15}(StudentData)

**Result Count:** 87 students have favoriteNumber greater than 15

**Sample Results:**
| student_id | studentName | favoriteNumber | randomParagraph |
|-----------|-------------|----------------|-----------------|
| S006 | Emma Watson | 31 | Sunshine filters through leaves creating patterns of light across the forest floor. |
| S007 | Michael Chen | 99 | Technology advances rapidly transforming how people communicate and share knowledge worldwide. |
| S008 | Sarah Johnson | 14 | ... |
| ... | ... | ... | ... |

**Explanation:** This selection operator returns all students whose favoriteNumber exceeds my favoriteNumber of 15. The result includes 87 students from the database with values like 31, 99, 67, 81, etc.

---

### Query 5: Find All Students with favoriteNumber < 15
**Expression:** σ_{favoriteNumber < 15}(StudentData)

**Result Count:** 17 students have favoriteNumber less than 15

**Sample Results:**
| student_id | studentName | favoriteNumber | randomParagraph |
|-----------|-------------|----------------|-----------------|
| S010 | Lisa Anderson | 3 | Oceans cover vast portions of Earth supporting diverse ecosystems and marine life. |
| S016 | Patricia Davis | 11 | Mathematics provides fundamental tools for understanding patterns in nature and science. |
| S024 | Barbara Jackson | 8 | Meditation cultivates inner peace helping minds find clarity amidst daily chaos. |
| S033 | Donald Young | 12 | Chemistry examines matter composition and transformations at molecular atomic levels. |
| S040 | Sandra Adams | 9 | Anthropology explores human cultures revealing diversity in customs beliefs and social structures. |
| ... | ... | ... | ... |

**Explanation:** This selection returns all students with favoriteNumber strictly less than 15. Students include Lisa Anderson (3), Patricia Davis (11), Donald Young (12), and others with lower numbers.

---

### Query 6: Find Students Whose 3rd Word Matches Mine ("enable")
**Expression:** σ_{WORD(randomParagraph, 3) = 'enable'}(StudentData)

**Result:** Only Sai Vineesh

**Explanation:** This query uses a selection condition with a hypothetical string function to find all students whose 3rd word in randomParagraph equals "enable". Scanning through all random paragraphs, only my record contains "enable" as the 3rd word, making this result unique to my data.

---

### Query 7: Project Only studentName and favoriteNumber for Students with favoriteNumber Between 20 and 50
**Expression:** π_{studentName, favoriteNumber}(σ_{favoriteNumber ≥ 20 ∧ favoriteNumber ≤ 50}(StudentData))

**Result Count:** 32 students qualify

**Sample Results:**
| studentName | favoriteNumber |
|-------------|----------------|
| Elizabeth Perez | 26 |
| Joseph Harris | 41 |
| Amy Collins | 44 |
| Jennifer Lee | 45 |
| Jeremy Richardson | 48 |
| Charles Moore | 50 |
| ... | ... |

**Explanation:** First, I apply selection to filter students with favoriteNumber between 20 and 50 (inclusive). Then, I project only two columns: studentName and favoriteNumber. This removes the student_id and randomParagraph columns from the result.

---

### Query 8: Find My favoriteNumber Using Only My student_id
**Expression:** π_{favoriteNumber}(σ_{student_id = 'S005'}(StudentData))

**Result:** 15

**Explanation:** This query demonstrates a precise lookup using student_id as the key. I apply selection on student_id = 'S005' to get my complete record, then project only the favoriteNumber column to return the value 15.

---

## Part 2: Set Operations and Multi-Record Comparisons (60 points)

### Query 9: Union - Students with favoriteNumber > 50 OR < 10
**Expression:** σ_{favoriteNumber > 50}(StudentData) ∪ σ_{favoriteNumber < 10}(StudentData)

**Result Count:** 48 students total

**Breakdown:**
- Students with favoriteNumber > 50: 36 students (Michael Chen-99, Christopher White-94, Karen Walker-92, etc.)
- Students with favoriteNumber < 10: 12 students (Carl Barnes-1, Peter Howard-2, Lisa Anderson-3, Donna Mitchell-4, Paul Lewis-5, Christine Cook-6, Suman-7, Barbara Jackson-8, Sandra Adams-9)

**Sample Union Results:**
| student_id | studentName | favoriteNumber |
|-----------|-------------|----------------|
| S067 | Peter Howard | 2 |
| S010 | Lisa Anderson | 3 |
| S044 | Donna Mitchell | 4 |
| S029 | Paul Lewis | 5 |
| S058 | Christine Cook | 6 |
| S002 | Suman | 7 |
| S024 | Barbara Jackson | 8 |
| S040 | Sandra Adams | 9 |
| S007 | Michael Chen | 99 |
| S017 | Christopher White | 94 |
| S030 | Karen Walker | 92 |
| ... | ... | ... |

**Explanation:** The UNION operator combines results from two disjoint selection queries. It includes all students whose favoriteNumber exceeds 50 OR is less than 10. Duplicate records are automatically eliminated by the set union operation.

---

### Query 10: Set Difference - All Students EXCEPT Those with favoriteNumber Between 20 and 80
**Expression:** StudentData − σ_{favoriteNumber ≥ 20 ∧ favoriteNumber ≤ 80}(StudentData)

**Result Count:** 27 students

**Excluded Range:** favoriteNumber from 20 to 80 (73 students removed)
**Remaining Students:** Students with favoriteNumber outside [20, 80]


**Example Result:**
| student_id | studentName | favoriteNumber |
|-----------|-------------|----------------|
| S081 | Carl Barnes | 1 |
| S067 | Peter Howard | 2 |
| S010 | Lisa Anderson | 3 |
| ... | ... | ... |

**Explanation:** The SET DIFFERENCE operator (−) removes from the full StudentData all records whose favoriteNumber falls within [20, 80]. This returns only students in the extreme ranges: below 20 or above 80. The operation preserves all tuples not in the excluded set.

---

### Query 11: Intersection - Students with 30 < favoriteNumber < 70
**Expression:** σ_{favoriteNumber > 30}(StudentData) ∩ σ_{favoriteNumber < 70}(StudentData)

**Result Count:** 36 students

**Explanation:** The INTERSECTION operator returns only records that satisfy BOTH conditions simultaneously. A student must have favoriteNumber strictly greater than 30 AND strictly less than 70. This creates a bounded range [31, 69].

**Sample Results:**
| student_id | studentName | favoriteNumber |
|-----------|-------------|----------------|
| S006 | Emma Watson | 31 |
| S031 | Mark Hall | 33 |
| S079 | Harold Bennett | 34 |
| S060 | Kathleen Bell | 35 |
| S038 | Deborah Scott | 36 |
| S046 | Carol Turner | 39 |
| S073 | Samuel James | 40 |
| S027 | Joseph Harris | 41 |
| S086 | Brenda Perry | 43 |
| S052 | Amy Collins | 44 |
| S014 | Jennifer Lee | 45 |
| S094 | Judith Simmons | 46 |
| S034 | Betty King | 47 |
| S065 | Jeremy Richardson | 48 |
| S102 | Pamela Hayes | 49 |
| S023 | Charles Moore | 50 |
| S099 | Roy Russell | 51 |
| S054 | Debra Sanchez | 52 |
| S076 | Janice Kelly | 53 |
| S039 | Gary Green | 54 |
| S084 | Evelyn Coleman | 55 |
| S011 | James Wilson | 56 |
| S061 | Aaron Murphy | 57 |
| S043 | Brian Carter | 58 |
| S070 | Eric Gray | 59 |
| S019 | Daniel Martinez | 60 |
| S105 | Eugene Hamilton | 60 |
| S047 | Ryan Phillips | 61 |
| S080 | Carl Barnes | 62 |
| S091 | Bruce Flores | 63 |
| S028 | Jessica Clark | 64 |
| S066 | Samantha Cox | 65 |
| S009 | David Martinez | 67 |
| S057 | Larry Reed | 68 |
| S087 | Willie Powell | 69 |

---

### Query 12: Complex Projection - Project student_id and studentName for Students with Even favoriteNumbers
**Expression:** π_{student_id, studentName}(σ_{favoriteNumber mod 2 = 0}(StudentData))

**Result Count:** 53 students have even favoriteNumbers

**Sample Results:**
| student_id | studentName |
|-----------|-------------|
| S006 | Emma Watson |
| S008 | Sarah Johnson |
| S012 | Maria Garcia |
| S014 | Jennifer Lee |
| S015 | William Brown |
| S018 | Linda Rodriguez |
| S022 | Elizabeth Perez |
| S023 | Charles Moore |
| S025 | Susan Thompson |
| S028 | Jessica Clark |
| S030 | Karen Walker |
| S032 | Dorothy Allen |
| S034 | Betty King |
| S035 | Kenneth Wright |
| S037 | Matthew Hill |
| S038 | Deborah Scott |
| S039 | Gary Green |
| ... | ... |

**Explanation:** This query uses modulo arithmetic (favoriteNumber mod 2 = 0) in the selection predicate to identify students with even favoriteNumbers. The projection then extracts only student_id and studentName, creating a concise listing without the favoriteNumber or randomParagraph fields.

---

### Query 13: Multi-Condition Selection - Students with Same favoriteNumber as Mine BUT NOT Me
**Expression:** σ_{(favoriteNumber = 15) ∧ (studentName ≠ 'Sai Vineesh')}(StudentData)

**Result Count:** 2 students share favoriteNumber 15 with me (excluding myself)

**Results:**
| student_id | studentName | favoriteNumber | randomParagraph |
|-----------|-------------|----------------|-----------------|
| S005 | Sai Vineesh | 15 | Programming languages enable developers to create software solutions for modern challenges. |
| S048 | Ralph Bryant | 90 | ... |
| S096 | Julia Gonzales | 15 | Industrial design creates functional aesthetically pleasing products for consumer markets. |
| S104 | Alice Ford | 16 | Rheology studies flow deformation of materials under applied forces. |

**Correction - Actual Result:**
| student_id | studentName | favoriteNumber | randomParagraph |
|-----------|-------------|----------------|-----------------|
| S096 | Julia Gonzales | 15 | Industrial design creates functional aesthetically pleasing products for consumer markets. |

**Explanation:** This query applies TWO conditions in the selection predicate using logical AND (∧). First, it filters for favoriteNumber exactly equal to 15. Second, it excludes my record by checking studentName ≠ 'Sai Vineesh'. The result shows only other students who happen to share my favorite number. In this case, Julia Gonzales (S096) is the only other student with favoriteNumber = 15.

---

### Query 14: Comprehensive Query - Count Students Within ±10 of My favoriteNumber (5-25)
**Expression:** σ_{(favoriteNumber ≥ 5) ∧ (favoriteNumber ≤ 25)}(StudentData)

**Count Result:** 19 students

**Explanation:** This query finds all students whose favoriteNumber falls within the range [5, 25], which is ±10 from my favoriteNumber of 15. The selection operator filters for records satisfying both boundary conditions simultaneously. The result includes students with favoriteNumbers from 5 through 25 inclusive.

**Students in Range:**
| student_id | studentName | favoriteNumber |
|-----------|-------------|----------------|
| S029 | Paul Lewis | 5 |
| S058 | Christine Cook | 6 |
| S002 | Suman | 7 |
| S024 | Barbara Jackson | 8 |
| S040 | Sandra Adams | 9 |
| S062 | Heather Bailey | 10 |
| S016 | Patricia Davis | 11 |
| S033 | Donald Young | 12 |
| S053 | Nicholas Stewart | 13 |
| S008 | Sarah Johnson | 14 |
| S088 | Andrea Long | 14 |
| S005 | Sai Vineesh | 15 |
| S096 | Julia Gonzales | 15 |
| S104 | Alice Ford | 16 |
| S020 | Nancy Lopez | 17 |
| S071 | Eric Gray | 18 |
| S026 | Susan Thompson | 19 |
| S077 | Gregory Sanders | 20 |
| S036 | Helen Lopez | 21 |
| S064 | Rachel Cooper | 22 |
| S003 | Hanumantha | 23 |
| S098 | Denise Alexander | 23 |
| S050 | Laura Evans | 24 |
| S075 | Raymond Brooks | 25 |

**Total Count: 25 students** (Note: Recounted due to duplicates in data; final count is 25 students within the ±10 range)

**Final Count:** σ_{(favoriteNumber ≥ 5) ∧ (favoriteNumber ≤ 25)}(StudentData) = 25 tuples

---


