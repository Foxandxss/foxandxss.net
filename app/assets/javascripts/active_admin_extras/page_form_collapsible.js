function collapse_old(parent_el, child_el) {
    $(parent_el).stop().animate({backgroundColor: '#DEDED9'}, 1000);
    $(parent_el).find('li').css('display', 'block');
    $(parent_el).siblings('fieldset').stop().animate({backgroundColor: '#F4F4F4'}, 500);
    $(parent_el).siblings('fieldset').find(child_el).css('display', 'none');
    $(parent_el).parent().siblings('fieldset').stop().animate({backgroundColor: '#F4F4F4'}, 500);
    $(parent_el).parent().siblings('fieldset').find(child_el).css('display', 'none');
}

function collapse_new(parent_el, child_el) {
    $(parent_el).stop().animate({backgroundColor: '#DEDED9'}, 1000);
    $(parent_el).find('li').css('display', 'block');
    $(parent_el).siblings('fieldset').stop().animate({backgroundColor: '#F4F4F4'}, 500);
    $(parent_el).siblings('fieldset').find(child_el).css('display', 'none');
    $(parent_el).siblings('li').find('fieldset').stop().animate({backgroundColor: '#F4F4F4'}, 500);
    $(parent_el).siblings('li').find('fieldset').find(child_el).css('display', 'none');
}

$(function() {
    $('#main_content .informations .input .has_many_fields, #main_content .links .input .has_many_fields').live('click', function() {
        collapse_old(this, 'li:not(:first)');
    });

    $('#main_content .has_many.links > .has_many_fields, #main_content .has_many.informations > .has_many_fields').live('click', function() {
        collapse_new(this, 'li:not(:first)');
    });

    $('#main_content .images .input .has_many_fields').live('click', function() {
        collapse_old(this, 'li:not(.file)');
    });

    $('#main_content .has_many.images > .has_many_fields').live('click', function() {
        collapse_new(this, 'li:not(.file)');
    });
});
