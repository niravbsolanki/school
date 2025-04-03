"use strict";
var commonDataSourceOnSelectBox = function () {

    var selectClass = function () {
        var classSelect2 = $('.class-select233');
        //start Select Subject  
        classSelect2.select2({
            theme: 'bootstrap4',
            ajax: {
                url: function () {
                    return $(this).data('url');
                },
                data: function (params) {
                    return {
                        search: params.term,
                    };
                },
                dataType: 'json',
                processResults: function (data) {
                    return {
                        results: data.map(function (item) {
                            return {
                                id: item.id,
                                text: item.name,
                                otherfield: item,
                            };
                        }),
                    }
                },
                //cache: true,
                delay: 250
            },
            placeholder: 'Search Class',
            allowClear: true
        });
        //end Select Subject     
    };

    var selectSubject = function () {
        var subjectSelect2 = $('.subject-select2333');
        //start Select Subject  
        subjectSelect2.select2({
            theme: 'bootstrap4',
            ajax: {
                url: function () {
                    return $(this).data('url');
                },
                data: function (params) {
                    return {
                        search: params.term,
                        id: $('#' + $(this).data('classId')).val(),
                    };
                },
                dataType: 'json',
                processResults: function (data) {
                    return {
                        results: data.map(function (item) {
                            return {
                                id: item.id,
                                text: item.name,
                                otherfield: item,
                            };
                        }),
                    }
                },
                //cache: true,
                delay: 250
            },
            placeholder: 'Search Subject',
            allowClear: true
        });
        //end Select Subject     
    };


    return {
        init: function () {
            selectSubject();
            selectClass();
        },

    };

}();

jQuery(document).ready(function () {
    commonDataSourceOnSelectBox.init();
    $(".select2-page").select2({
        theme: 'bootstrap4',
        placeholder: 'Select an option'
    });
    $(document).find(".select2-modal").select2({
        theme: 'bootstrap4',
        placeholder: 'Select an option',
        dropdownParent: $('.modal')
    });
    $(".select-exam").select2({
        theme: 'bootstrap4',
        placeholder: 'Select Exam'
    });
    $(".select-student").select2({
        theme: 'bootstrap4',
        placeholder: 'Select Student'
    });
    /**
     * Get section & subject by class id
     * @params pass only class id
     */
    //Get section list by class
    $(document).on('change', '.get-section-subject', function (e) { 
        e.preventDefault();
        var el = $(this);
        var url = el.attr('data-sectionSubjectUrl');
        var isPrintSection = el.attr('data-section-print');
        var classId = el.val();
        var s = $('#section');
         addLoadSpiner(s);

        $.ajax({
            type: "GET",
            url: url,
            data: { 'classId': classId },
        }).always(function () {
            $('#subject').empty();
            if (isPrintSection == "1") {
                $('#section').empty();
                $('#student').empty();
                
            }
        }).done(function (response) {
            if (isPrintSection == "1") {
               

                $('#section').append('<option value=""></option>');
                $.each(response.sections, function (key, value) {
                    $('#section').append('<option value=' + value.id + '>' + value.name + '</option>');
                });

                hideLoadSpinner(s);

            }
            $('#subject').append('<option value=""></option>');
            $.each(response.subjects, function (key, value) {
                $('#subject').append('<option value=' + value.id + '>' + value.name + '</option>');
            });
        });
    });

    //----define in Model Get section list by class-----
    $(document).on('change', '.modal-get-section-subject', function (e) {
        e.preventDefault();
        var el = $(this);
        var url = el.attr('data-sectionSubjectUrl');
        var isPrintSection = el.attr('data-section-print');
        var classId = el.val();

        $.ajax({
            type: "GET",
            url: url,
            data: { 'classId': classId },
        }).always(function () {
            $('#modal_subject').empty();
            if (isPrintSection == "1") {
                $('#modal_subject').empty();
            }
        }).done(function (response) {
            if (isPrintSection == "1") {
                $('#section').append('<option value=""></option>');
                $.each(response.sections, function (key, value) {
                    $('#section').append('<option value=' + value.id + '>' + value.name + '</option>');
                });
            }
            $('#modal_subject').append('<option value=""></option>');
            $.each(response.subjects, function (key, value) {
                $('#modal_subject').append('<option value=' + value.id + '>' + value.name + '</option>');
            });
        });
    });

    //Get academic year
    $(document).on('change', '.getacademicyear', function (e) { 
        e.preventDefault();
        var el = $(this);
        var url = el.attr('data-academicUrl');
        var fromyear = el.val();
        var s = $('#to_academicyear');
        
        $.ajax({
            type: "GET",
            url: url,
            data: { 'fromyear': fromyear },
        }).always(function () {
            $('#to_academicyear').empty();
        }).done(function (response) {
            $('#to_academicyear').append('<option value=""></option>');
            $.each(response, function (key, value) {
                $('#to_academicyear').append('<option value=' + value.id + '>' + value.name + '</option>');
            });
        });
    });

    //Get To Class List
    $(document).on('change', '.getToclass', function (e) { 
        e.preventDefault();
        var el = $(this);
        var url = el.attr('data-classtoUrl'); 
        var sectionurl = el.attr('data-sectionUrl');
        var fromclass = el.val();
        var s = $('#to_class');
        $.ajax({
            type: "GET",
            url: url,
            data: { 'fromclass': fromclass },
        }).always(function () {
            $('#to_class').empty();
        }).done(function (response) {
            $('#to_class').append('<option value=""></option>');
            $.each(response, function (key, value) {
                $('#to_class').append('<option value=' + value.id + '>' + value.name + '</option>');
            });            
        });
        getsectionbyclass(fromclass,sectionurl);
    });

    function getsectionbyclass(classid,sectionurl)
    {
        if(classid)
        {
            var s = $('#from_section');
            addLoadSpiner(s);
            $.ajax({
                type: "GET",
                url: sectionurl,
                data: { 'classId': classid },
            }).always(function () {
                $('#from_section').empty();
            }).done(function (response) {
                $('#from_section').append('<option value=""></option>');
                $.each(response, function (key, value) {
                    $('#from_section').append('<option value=' + value.id + '>' + value.name + '</option>');
                });
                hideLoadSpinner(s);
            });
        }
    }

    //Get To Section List
    $(document).on('change', '.getTosection', function (e) { 
        e.preventDefault();
        var el = $(this);
        var url = el.attr('data-sectiontoUrl'); 
        var to_class = el.val();
        var s = $('#to_section');
        $.ajax({
            type: "GET",
            url: url,
            data: { 'to_class':to_class },
        }).always(function () {
            $('#to_section').empty();
        }).done(function (response) {
            $('#to_section').append('<option value=""></option>');
            $.each(response, function (key, value) {
                $('#to_section').append('<option value=' + value.id + '>' + value.name + '</option>');
            });            
        });
    });




    /**
     * Get subject using section & class id combinations
     * @params pass class id and section id array
     */
    $(document).on('change', '.subjectByClassSectionCombination', function (e) {
        e.preventDefault();
        var el = $(this);
        var url = el.attr('data-subjectBySecClassUrl');
        var classId = $('#class').val();
        var sectionIds = el.val();

        $.ajax({
            type: "GET",
            url: url,
            data: { 'classId': classId, 'sectionIds': sectionIds },
        }).always(function () {
            $('#subject').empty();            
        }).done(function (response) {
            $('#subject').append('<option value=""></option>');
            $.each(response, function (key, value) {
                $('#subject').append('<option value=' + value.id + '>' + value.name + '</option>');
            });
        });
    });
    /**
     * Get Chapter on select subject
     * @params class_id,subject_id
     * Note:Give class id atrribute value as a class (id="class") to get it's value
     */
    $(document).on('change', '.subject-list', function (e) {
        e.preventDefault();
        var el = $(this);
        var url = el.attr('data-chapterUrl');
        var classId = $('#class').val();
        var subjectId = el.val();

        var s = $('#chapter');
         addLoadSpiner(s);

        $.ajax({
            type: "GET",
            url: url,
            data: { 'classId': classId, "subjectId": subjectId },
        }).always(function () {
            $('#chapter').empty();
        }).done(function (response) {
            $('#chapter').append('<option value=""></option>');
            $.each(response, function (key, value) {
                $('#chapter').append('<option value=' + value.id + '>' + value.name + '</option>');
            });
            hideLoadSpinner(s);
        });
    });

    //define in Model Get subject-list by class

     $(document).on('change', '.modal-subject-list', function (e) {
        e.preventDefault();
        var el = $(this);
        var url = el.attr('data-chapterUrl');
        var classId = $('#modal_class').val();
        var subjectId = el.val();
       // alert(subjectId);

        $.ajax({
            type: "GET",
            url: url,
            data: { 'classId': classId, "subjectId": subjectId },
        }).always(function () {
            $('#chapter').empty();
        }).done(function (response) {
            $('#chapter').append('<option value=""></option>');
            $.each(response, function (key, value) {
                $('#chapter').append('<option value=' + value.id + '>' + value.name + '</option>');
            });
        });
    });


    //Get section list by class
    $(document).on('change', '.get-sections', function (e) {
        e.preventDefault();
        var el = $(this);
        var url = el.attr('data-section');
        var classId = el.val();

        $.ajax({
            type: "GET",
            url: url,
            data: { 'classId': classId },
        }).always(function () {
            $('#show_section_data').empty();
        }).done(function (response) {
            $("#sec").show();
            $.each(response, function (key, value) {
                $("#show_section_data").append("<div class='form-check col-lg-3 form-check-inline mb-3'><input type='checkbox' class='form-check-input section-val' id='section_" + value.id + "' name='section_id[]' data-rule-required='true' value='" + value.id + "'/><label class='form-check-label' style='padding-left:28px;'>" + value.name + " </label></div>");
            });
        });
    });
    //Get subject group by class & section
    $(document).on('change', '.get-subjectgroup', function (e) {
        e.preventDefault();
        var el = $(this);
        var url = el.attr('data-subjectGroupUrl');
        var classId = el.val();

        $.ajax({
            type: "GET",
            url: url,
            data: { 'classId': classId },
        }).always(function () {
            $('#subjectGroup').empty();
            $('#subject').empty();
        }).done(function (response) {
            $("#subjectGroup").append('<option value=""></option>');
            $.each(response, function (key, value) {
                $("#subjectGroup").append('<option value=' + value.id + '>' + value.name + '</option>');
            });
        });
    });
    //Get Subject Group by Class & Section
    //Get subject group by class & section
    $(document).on('select2:open', '.subject-group33', function (e) {
        e.preventDefault();
        var el = $(this);
        var url = el.attr('data-subjectGroupUrl');
        var classId = $('#class').val();
        var sectionIds = new Array();
        $.each($("input[name='section_id[]']:checked"), function () {
            sectionIds.push($(this).val());
            // or you can do something to the actual checked checkboxes by working directly with  'this'
            // something like $(this).hide() (only something useful, probably) :P
        });
        $.ajax({
            type: "GET",
            url: url,
            data: { 'classId': classId, "sectionIds": sectionIds },
        }).always(function () {
            $('#subjectGroup').empty();
            $('#subject').empty();
        }).done(function (response) {
            $("#subjectGroup").append('<option value=""></option>');
            $.each(response, function (key, value) {
                $("#subjectGroup").append('<option value=' + value.id + '>' + value.name + '</option>');
            });
        });
    });
    //Get Subjects by subject group id
    $(document).on('change', '.subject-group', function (e) {
        e.preventDefault();
        var el = $(this);
        var url = el.attr('data-subjectUrl');
        var subjectGroupId = el.val();

        $.ajax({
            type: "GET",
            url: url,
            data: { 'subjectGroupId': subjectGroupId },
        }).always(function () {
            $('#subject').empty();
        }).done(function (response) {
            $("#subject").append('<option value=""></option>');
            $.each(response, function (key, value) {
                $("#subject").append('<option value=' + value.id + '>' + value.name + '</option>');
            });
        });
    });
    //Get section & subject by subject group
    $(document).on('change', '.subject-group-with-section', function (e) {
        e.preventDefault();
        var el = $(this);
        var url = el.attr('data-subjectUrl');
        var sectionUrl = el.attr('data-section');
        var subjectGroupId = el.val();

        $.ajax({
            type: "GET",
            url: url,
            data: { 'subjectGroupId': subjectGroupId },
        }).always(function () {
            $('#subject').empty();
        }).done(function (response) {
            $("#subject").append('<option value=""></option>');
            $.each(response, function (key, value) {
                $("#subject").append('<option value=' + value.id + '>' + value.name + '</option>');
            });
        });
    });

    //Start : get student by classSection
    $(document).on('change', '.studentByClassSectionCombination', function (e) {
        e.preventDefault();
        var el = $(this);
        var url = el.attr('data-studentBySecClassUrl');
        var classId = $('#class').val();
        var sectionIds = $('#section').val();

        var s = $('#student');
        addLoadSpiner(s);

        $.ajax({
            type: "GET",
            url: url,
            data: { 'classId': classId, 'sectionIds': sectionIds },
        }).always(function () {
            $('#student').empty();            
        }).done(function (response) {
            //console.log(response);
            $('#student').append('<option value=""></option>');
            $.each(response, function (key, value) {
                console.log(value);
                $('#student').append('<option value=' + value.student_id + '>' + value.student_name.full_name + '</option>');
            });
            hideLoadSpinner(s);
        });
    });
    //end : get student by classSection

//Start : get exam by classSection
    $(document).on('change', '.examByClassSectionCombination', function (e) {
        e.preventDefault();
        var el = $(this);
        var url = el.attr('data-examBySecClassUrl');
        var classId = $('#class').val();
        var sectionIds = $('#section').val();

        var s = $('#exam_title');
        addLoadSpiner(s);

        $.ajax({
            type: "GET",
            url: url,
            data: { 'classId': classId, 'sectionIds': sectionIds },
        }).always(function () {
            $('#exam_title').empty();            
            $('#subject_id').empty();            
        }).done(function (response) {
            $('#exam_title').append('<option value=""></option>');
            $.each(response, function (key, value) {
                $('#exam_title').append('<option value=' + value.id + '>' + value.exam_title + '</option>');
            });
            hideLoadSpinner(s);
        });
    });
    //end : get exam by classSection

    //Start : get exam by student 
    $(document).on('change', '.examByStudentCombination', function (e) {
        e.preventDefault();
        var el = $(this);
        var url = el.attr('data-examByStudentUrl');
        var classId = $('#class').val();
        var sectionIds = $('#section').val();
        //var examId = $('#exam_title').val();

        $.ajax({
            type: "GET",
            url: url,
            data: { 'classId': classId, 'sectionIds': sectionIds },
        }).always(function () {
            $('#student_id').empty();            
        }).done(function (response) {
            $('#student_id').append('<option value=""></option>');
            $.each(response, function (key, value) {
                console.log(value);
                $('#student_id').append('<option value=' + value.student_id + '>' + value.student_name.full_name + '</option>');
            });
        });
    });
    //End : get exam by student 

    //Start : get subject by Exam
    $(document).on('change', '.subjectByExamlist', function (e) {
        e.preventDefault();
        var el = $(this);
        var url = el.attr('data-subjectByExamUrl');
        var classId = $('#class').val();
        var sectionIds = $('#section').val();
        var online_exam_id = $('#exam_title').val();
       // alert(online_exam_id);
        var s = $('#subject_id');
        addLoadSpiner(s);

        $.ajax({
            type: "GET",
            url: url,
            data: { 'classId': classId, 'sectionIds': sectionIds,'online_exam_id':online_exam_id },
        }).always(function () {
            $('#subject_id').empty();            
        }).done(function (response) { console.log(response);
            $('#subject_id').append('<option value=""></option>');
            $.each(response, function (key, value) {
                $('#subject_id').append('<option value=' + value.id + '>' + value.subject.name + '</option>');
            });
            hideLoadSpinner(s);
        });
    });
    //end : get exam by classSection

    //Start : get Exams by Exam Type
    $(document).on('change', '.get-exams-list', function (e) {
        e.preventDefault();
        var el = $(this);
        var url = el.attr('data-examtypelistUrl');
        var examtypeId = el.val();
        var totalMarks = el.find(":selected").attr('data-totalmarks');
       // el.closest('tr').find('input[type="text"]').attr("disabled", false);
       // el.closest('tr').find('.percResult').attr("disabled", false);
        //el.closest('tr').find('.obtainedcls').attr("disabled", false);
        //el.closest('tr').find('.obtainedcls').attr("data-totMarks", totalMarks);
        checkoption();
        $.ajax({
            type: "GET",
            url: url,
            data: { 'examtypeId': examtypeId },
        }).always(function () {
            el.closest('tr').find('.examlist').empty();            
        }).done(function (response) { 
            el.closest('tr').find('.examlist').append('<option value=""></option>');
            $.each(response, function (key, value) {
                el.closest('tr').find('.examlist').append('<option value=' + value.id + '>' + value.exam_title + '</option>');
            });
        });
    });    
    //end : get Exams by Exam Type

    $(document).on('change', '.examlist', function (e) {
        var totalselect = $(this).find(':selected').length;
        if(totalselect>0)
        {
            $(this).closest('tr').find('.percResult').attr("disabled", false);
        } else{
            $(this).closest('tr').find('.percResult').attr("disabled", true);
        }
    });

    function checkoption()
    {
        $('.get-exams-list').each(function(){
            var $this = $(this);
            $('.get-exams-list').not($this).find('option').each(function(){
               if($(this).attr('value') == $this.val())
                   $(this).attr('disabled',true);
            });
        });    
    }



    //------------------------------------NS ADD
    //Loader End
    function addLoadSpiner(el) {
        //debugger;
        if (el.length > 0) {
            if ($("#img_" + el[0].id).length > 0) {
                $("#img_" + el[0].id).css('display', 'block');
            }               
            else {
                /*var img = $('<img class="ddloading">');
                img.attr('id', "img_" + el[0].id);
                img.attr('src', 'storage/default/orange_circles.gif');
                img.css({ 'display': 'block', 'width': '30px', 'height': '30px', 'z-index': '100', 'float': 'right' ,'margin-right': '22px','margin-top': '10px'});
                img.prependTo(el[0].nextElementSibling);*/
                var img = $('<span class="ddloading"><i class="fas fa-spinner fa-pulse"></i>');
                img.attr('id', "img_" + el[0].id);
                //img.text('<i class="fas fa-spinner fa-pulse"></i>');
                //img.attr('src', 'storage/default/orange_circles.gif');
                img.css({ 'display': 'block', 'width': '22px', 'height': '0px', 'z-index': '100', 'float': 'right' ,'margin-right': '22px','margin-top': '12px'});
                //$(".ddloading").html('');
                img.prependTo(el[0].nextElementSibling);
            }
            el.prop("disabled", true);               
        }
    }

    //Loader End
    function hideLoadSpinner(el) {
        if (el.length > 0) {
            if ($("#img_" + el[0].id).length > 0) {
                 setTimeout(function () {
                     $("#img_" + el[0].id).css('display', 'none');
                     el.prop("disabled", false);
                }, 500);                    
            }
        }
    }

});