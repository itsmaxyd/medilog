// Minimal JavaScript for scroll effects or interaction
document.addEventListener('DOMContentLoaded', () => {
    // Add active state to nav on scroll
    const nav = document.querySelector('nav');
    window.addEventListener('scroll', () => {
        if (window.scrollY > 50) {
            nav.style.boxShadow = '0 10px 30px -10px rgba(0,0,0,0.5)';
        } else {
            nav.style.boxShadow = 'none';
        }
    });

    // Smooth scroll for all links (already handled by CSS, but good for custom behaviors)
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            const target = document.querySelector(this.getAttribute('href'));
            if (target) {
                target.scrollIntoView({
                    behavior: 'smooth'
                });
            }
        });
    });
});
